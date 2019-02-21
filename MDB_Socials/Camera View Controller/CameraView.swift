//
//  CameraView.swift
//  MDB_Socials
//
//  Created by Andrew Santoso on 2/20/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

//plenty of code taken from Zero2Launch
class CameraView: UIViewController {
    
    var captureSession = AVCaptureSession()
    var backCamera: AVCaptureDevice?
    var frontCamera: AVCaptureDevice?
    var currentCamera: AVCaptureDevice?
    var photoOutput: AVCapturePhotoOutput?
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    var image: UIImage?
    
    let imagePicker = UIImagePickerController()
    
    lazy var cameraRollPreviewContainerView: UIView = {
        let cameraRollPreviewContainerView = UIView()
        cameraRollPreviewContainerView.translatesAutoresizingMaskIntoConstraints = false
        return cameraRollPreviewContainerView
    }()
    
    lazy var cameraRollPreviewImageView: UIImageView = {
        let cameraRollPreviewImageView = UIImageView()
        cameraRollPreviewImageView.contentMode = .scaleAspectFit
        cameraRollPreviewImageView.translatesAutoresizingMaskIntoConstraints = false
        return cameraRollPreviewImageView
    }()
    
    lazy var cameraRollButton: UIButton = {
        let cameraRollButton = UIButton()
        cameraRollButton.translatesAutoresizingMaskIntoConstraints = false
        cameraRollButton.addTarget(self, action: #selector(presentImagePicker), for: .touchUpInside)
        return cameraRollButton
    }()
    
    lazy var takePhotoButton: UIButton = {
        let takePhotoButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        takePhotoButton.backgroundColor = .white
        takePhotoButton.layer.masksToBounds = true
        takePhotoButton.layer.cornerRadius = takePhotoButton.frame.width / 2
        takePhotoButton.addTarget(self, action: #selector(takePhotoPressed), for: .touchUpInside)
        takePhotoButton.translatesAutoresizingMaskIntoConstraints = false
        return takePhotoButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        setUpCameraSession()
        setUpDevice()
        setUpInputOutput()
        setUpPreviewLayer()
        startRunningCaptureSession()
        setUpViews()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.shared.statusBarStyle = .lightContent
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIApplication.shared.statusBarStyle = .default
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func setUpCameraSession() {
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }
    
    func setUpDevice() {
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession.init(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
        
        let devices = deviceDiscoverySession.devices
        
        for device in devices {
            if device.position == AVCaptureDevice.Position.back {
                backCamera = device
            } else if device.position == AVCaptureDevice.Position.front {
                frontCamera = device
            }
        }
        
        currentCamera = backCamera
    }
    
    func setUpInputOutput() {
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!)
            captureSession.addInput(captureDeviceInput)
            photoOutput = AVCapturePhotoOutput()
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
            captureSession.addOutput(photoOutput!)
        } catch {
            print("ERROR: \(error)")
        }
    }
    
    func setUpPreviewLayer() {
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        cameraPreviewLayer?.frame = self.view.safeAreaLayoutGuide.layoutFrame
        self.view.layer.insertSublayer(cameraPreviewLayer!, at: 0)
    }
    
    func startRunningCaptureSession() {
        captureSession.startRunning()
    }
    
    @objc func takePhotoPressed(_ sender: Any) {
        let settings = AVCapturePhotoSettings()
        photoOutput?.capturePhoto(with: settings, delegate: self)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func presentImagePicker(_ sender: UIButton) {
        self.imagePicker.allowsEditing = true
        self.imagePicker.sourceType = .photoLibrary
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    func pickedPhoto() {
        performSegue(withIdentifier: "showTakenPhoto", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTakenPhoto" {
            if let destinationVC = segue.destination as? ShowPhoto {
                destinationVC.image = self.image
            }
        }
    }
    
    
}


