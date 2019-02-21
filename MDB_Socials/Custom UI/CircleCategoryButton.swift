//
//  CircleCategoryButton.swift
//  MDB_Socials
//
//  Created by Andrew Santoso on 2/20/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit

class CircleCategoryButton: UIButton {
    
    let categoryLabel: UILabel = UILabel()
    
    var chosen: Bool = false {
        didSet {
            if chosen == true {
                self.backgroundColor = selectedBackgroundColor
                self.categoryLabel.textColor = selectedTextColor
                if selectedCategoryName != "" {
                    self.categoryLabel.text = selectedCategoryName
                }
            } else {
                self.backgroundColor = regularBackgroundColor
                self.categoryLabel.textColor = regularTextColor
                self.categoryLabel.text = categoryName
            }
        }
    }
    var categoryName: String
    var selectedCategoryName: String
    var regularBackgroundColor: UIColor
    var regularTextColor: UIColor
    var selectedBackgroundColor: UIColor
    var selectedTextColor: UIColor
    var circle: Bool
        
    init(frame: CGRect, categoryName: String, selectedCategoryName: String = "", regularBackgroundColor: UIColor, regularTextColor: UIColor, selectedBackgroundColor: UIColor, selectedTextColor: UIColor, circle: Bool = true) {
        self.categoryName = categoryName
        self.categoryLabel.text = categoryName
        self.selectedCategoryName = selectedCategoryName
        self.regularBackgroundColor = regularBackgroundColor
        self.regularTextColor = regularTextColor
        self.selectedBackgroundColor = selectedBackgroundColor
        self.selectedTextColor = selectedTextColor
        self.circle = circle
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        print("self.frame \(self.frame)")
        print("self.backgroundColor \(self.backgroundColor)")
        
        if circle == true {
            self.layer.cornerRadius = self.frame.height / 2
        } else {
            self.layer.cornerRadius = self.frame.height * 0.2
        }
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = regularTextColor.cgColor
        self.isUserInteractionEnabled = true
        self.backgroundColor = regularBackgroundColor
        
        categoryLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        //        categoryLabel.numberOfLines = -1
        categoryLabel.lineBreakMode = .byWordWrapping
        categoryLabel.numberOfLines = 0
        categoryLabel.textColor = regularTextColor
        categoryLabel.textAlignment = .center
        
        addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        categoryLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.animateButtonDown()        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.animateButtonUp()
        chosen = !chosen
    }
    
}

extension UIView {
    
    func animateButtonDown() {
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction, .curveEaseIn], animations: {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: nil)
    }
    
    func animateButtonUp() {
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction, .curveEaseOut], animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
}
