//
//  CameraView - UI.swift
//  MDB_Socials
//
//  Created by Andrew Santoso on 2/20/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit

extension CameraView {
    
    func setUpViews() {
        
        view.addSubview(cameraRollPreviewContainerView)
        cameraRollPreviewContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        cameraRollPreviewContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        cameraRollPreviewContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        cameraRollPreviewContainerView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        cameraRollPreviewContainerView.addSubview(cameraRollPreviewImageView)
        cameraRollPreviewImageView.leadingAnchor.constraint(equalTo: cameraRollPreviewContainerView.leadingAnchor).isActive = true
        cameraRollPreviewImageView.trailingAnchor.constraint(equalTo: cameraRollPreviewContainerView.trailingAnchor).isActive = true
        cameraRollPreviewImageView.bottomAnchor.constraint(equalTo: cameraRollPreviewContainerView.bottomAnchor).isActive = true
        cameraRollPreviewImageView.topAnchor.constraint(equalTo: cameraRollPreviewContainerView.topAnchor).isActive = true
        
        cameraRollPreviewContainerView.addSubview(cameraRollButton)
        cameraRollButton.leadingAnchor.constraint(equalTo: cameraRollPreviewContainerView.leadingAnchor).isActive = true
        cameraRollButton.trailingAnchor.constraint(equalTo: cameraRollPreviewContainerView.trailingAnchor).isActive = true
        cameraRollButton.bottomAnchor.constraint(equalTo: cameraRollPreviewContainerView.bottomAnchor).isActive = true
        cameraRollButton.topAnchor.constraint(equalTo: cameraRollPreviewContainerView.topAnchor).isActive = true
        
        view.addSubview(takePhotoButton)
        takePhotoButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        takePhotoButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        takePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        takePhotoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        
        
        //        let imgManager = PHImageManager.default()
        //        let requestOptions = PHImageRequestOptions()
        //        requestOptions.isSynchronous = true
        //        requestOptions.deliveryMode = .highQualityFormat
        //
        //        let fetchOptions = PHFetchOptions()
        //        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        //
        //        let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        //        imgManager.requestImage(for: fetchResult.object(at: 0), targetSize: CGSize(width: 40, height: 40), contentMode: .aspectFill, options: requestOptions, resultHandler: { (image, error) in
        //            if image != nil {
        //                self.cameraRollPreviewImageView.image = image!
        //            } else {
        //                self.cameraRollPreviewImageView.image = UIImage()
        //            }
        //        })
        cameraRollPreviewImageView.image = UIImage(named: "Family.jpg")
        cameraRollPreviewContainerView.layer.masksToBounds = true
        self.cameraRollPreviewContainerView.layer.cornerRadius = 8
    }
}
