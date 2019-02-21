//
//  NewSocialViewController - TextView.swift
//  MDB_Socials
//
//  Created by Andrew Santoso on 2/20/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit

extension NewSocialViewController: UITextViewDelegate {
    
    // gets called whenver someone types a character
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: textView.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size) // returns estimated size of the text view that is able to fit all the text inside of it; proper size for what you need for the text view to autosize itself
        
        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
        
        descriptionView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                let newHeight = 8 + estimatedSize.height + 15
                if newHeight > 70 {
                    constraint.constant = newHeight
                } else {
                    constraint.constant = 70
                }
            }
        }
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = UIColor.lightGray
        }
    }
}
