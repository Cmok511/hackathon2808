//
//  ProfileViewController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 28.07.2023.
//

import Foundation
import UIKit

final class ProfileViewController: BaseViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!    //for configureImagePicker
    private var avatarPicker = UIImagePickerController()
    private var selectedAvatar: UIImage?
    @IBOutlet private weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.addRadius()
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
    
    @IBAction func changeAvatarButtonTapped(_ sender: Any) {
        presentCamera(picker: avatarPicker)
    }
    
}
//MARK: - UIImagePickerControllerDelegate

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        avatarImageView.image = image
        selectedAvatar = image
        dismiss(animated: true)
    }
}
