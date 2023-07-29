//
//  PopupAchivmentController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit
import Toast

protocol PopupAchivmentControllerDelagate: AnyObject {
    func selectedAchivment(title: String?, image: UIImage?)
}

final class PopupAchivmentController: BaseViewController {
    weak var delegate: PopupAchivmentControllerDelagate?
    private let photoPicker = UIImagePickerController()
    @IBOutlet private weak var photoView: UIImageView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    private weak var selectedImage: UIImage?
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        saveButton.addRadius()
        cancelButton.addRadius()
        photoView.addRadius()
        photoView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(photoViewTapped)))
        
    }
    
    @objc private func photoViewTapped() {
        presentCamera(picker: photoPicker)
    }
    
    //MARK: actions
    @IBAction func cancelTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        
            if self.titleTextField.text != "" && self.selectedImage != nil {
                dismiss(animated: true) {
                    self.delegate?.selectedAchivment(title: self.titleTextField.text, image: self.selectedImage)
                }
            } else {
                self.view.makeToast("Заполните все поля. Выберите фото и укажите описание")
            }

    }
    
    
    
    //for configureImagePicker
    private func chooseImagePicker(source: UIImagePickerController.SourceType, imagePicker: UIImagePickerController) {
        if UIImagePickerController.isSourceTypeAvailable(source){
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
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
    
}
extension PopupAchivmentController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        selectedImage = image
        photoView.image = image
        dismiss(animated: true)
    }
}

