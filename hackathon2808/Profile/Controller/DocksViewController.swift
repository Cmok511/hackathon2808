//
//  DocksViewController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit

final class DocksViewController: BaseViewController {
    
    @IBOutlet private weak var passport1: UIImageView!
    @IBOutlet private weak var passport2: UIImageView!
    @IBOutlet private weak var snils: UIImageView!
    @IBOutlet private weak var inn: UIImageView!
    @IBOutlet private weak var nextButton: UIButton!
    
    
    private lazy var passport1Picker = UIImagePickerController()
    private lazy var passport2Picker = UIImagePickerController()
    private lazy var snilsPicker = UIImagePickerController()
    private lazy var innPicker = UIImagePickerController()
    
    
    //ForSend
    private var passport1Image: UIImage?
    private var passport2Image: UIImage?
    private var snilsImage: UIImage?
    private var innImage: UIImage?
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //Actions
    @objc private func passport1Tapped() {
        print("passport1Tapped")
        presentCamera(picker: passport1Picker)
    }
    @objc private func passport2Tapped() {
        print("passport2Tapped")
        presentCamera(picker: passport2Picker)
        
    }
    @objc private func snilsTapped() {
        print("snilsTapped")
        presentCamera(picker: snilsPicker)
    }
    @objc private func innTapped() {
        print("innTapped")
        presentCamera(picker: innPicker)
        
    }
    
    
    private func setupUI() {
        nextButton.addRadius()
        passport1.addRadius()
        passport2.addRadius()
        snils.addRadius()
        inn.addRadius()
        passport1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(passport1Tapped)))
        passport2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(passport2Tapped)))
        snils.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(snilsTapped)))
        inn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(innTapped)))
    }
    
    
    func presentCamera(picker: UIImagePickerController) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // select Camera
        let camera = UIAlertAction(title: "Снять фото", style: .default) { _ in
            self.chooseImagePicker(source: .camera, imagePicker: picker)
        }
        // select Gallery
        let photo = UIAlertAction(title: "Выбрать из галереи", style: .default) { _ in
            self.chooseImagePicker(source: .photoLibrary, imagePicker: picker)
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        
        actionSheet.addAction(camera)
        actionSheet.addAction(photo)
        actionSheet.addAction(cancel)
        present(actionSheet, animated: true)
    }
    
    private func chooseImagePicker(source: UIImagePickerController.SourceType, imagePicker: UIImagePickerController) {
        if UIImagePickerController.isSourceTypeAvailable(source){
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
}
//MARK: - UIImagePickerControllerDelegate

extension DocksViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        
        if picker == passport1Picker {
            passport1Image = image
            passport1.image = image
        }
        
        if picker == passport2Picker {
            passport2Image = image
            passport2.image = image
        }
        
        if picker == snilsPicker {
            snilsImage = image
            snils.image = image
        }
        
        if picker == innPicker {
            innImage = image
            inn.image = image
        }
        dismiss(animated: true)
    }
}

