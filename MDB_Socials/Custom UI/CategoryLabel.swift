//
//  CategoryLabel.swift
//  MDB_Socials
//
//  Created by Andrew Santoso on 2/20/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit

class CategoryLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLabel()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
        self.setupLabel()
    }
    
    private func setupLabel() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.white
        self.font = UIFont.boldSystemFont(ofSize: 17)
        self.textColor = Constants.lightBlue
        self.textAlignment = .left
    }
}

