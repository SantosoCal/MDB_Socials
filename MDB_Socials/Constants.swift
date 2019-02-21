//
//  Constants.swift
//  MDB_Pokedex
//
//  Created by Andrew Santoso on 2/14/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    
    static let lightBlue: UIColor = UIColor(red: 66/255, green: 176/255, blue: 244/255, alpha: 1)
    static let correctGreen: UIColor = UIColor(red: 8/255, green: 241/255, blue: 54/255, alpha: 1)
    static let wrongRed: UIColor = UIColor(red: 244/255, green: 0, blue: 0, alpha: 1)
    static let mdbYellow: UIColor = UIColor(red: 254/255, green: 232/255, blue: 43/255, alpha: 1)
    
    static func createThumbnail(image: UIImage) -> UIImage {
        let imageData = image.pngData()!
        let options = [
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceThumbnailMaxPixelSize: 800] as CFDictionary
        let source = CGImageSourceCreateWithData(imageData as CFData, nil)!
        let imageReference = CGImageSourceCreateThumbnailAtIndex(source, 0, options)!
        let thumbnail = UIImage(cgImage: imageReference)
        return thumbnail
    }
    
    static func calculateImageViewSize(imageView: UIImageView) -> CGRect {
        if let myImage = imageView.image {
            let myImageWidth = myImage.size.width
            let myImageHeight = myImage.size.height
            let myViewWidth = imageView.frame.size.width
            
            let ratio = myViewWidth / myImageWidth
            let scaledHeight = myImageHeight * ratio
            
            return CGRect(x: 0, y: 0, width: myViewWidth, height: scaledHeight)
        }
        
        return CGRect(x: -1.0, y: -1.0, width: -1.0, height: -1.0)
        
    }
    
    static func addSingleQuote(string: String) -> String {
        return "'\(string)'"
    }
    
}
