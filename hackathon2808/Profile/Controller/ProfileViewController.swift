//
//  ProfileViewController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 28.07.2023.
//

import Foundation
import UIKit
import PromiseKit
import Toast

final class ProfileViewController: BaseViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!    //for configureImagePicker
    private lazy var avatarPicker = UIImagePickerController()
    private let model = ProfileModel()
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var patronomicTextField: UITextField!
    @IBOutlet weak var secondNameTxetField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!
    @IBOutlet weak var genderTxetField: UITextField!
    @IBOutlet private weak var nextButton: UIButton!
    
    @IBOutlet weak var avatarSpinner: UIActivityIndicatorView!
    //MARK: forSend
    private var selectedGender: Gender?
    private var selectedBirthDate: Int?
    private var selectedAvatar: UIImage? {
        didSet {
            changeAvatar()
        }
    }
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.addRadius()
        genderTxetField.delegate = self
        birthDateTextField.delegate = self
    }
    
    
    @IBAction func nextButtonTap(_ sender: UIButton) {
        updateUser()
    }
    
    private func changeAvatar() {
        guard let imageData = selectedAvatar?.jpegData(compressionQuality: 0.5) else { return }
        avatarSpinner.startAnimating()
        firstly {
            model.changeImage(image: imageData)
        }.done { data in
            self.avatarSpinner.stopAnimating()
            if data.message?.lowercased() == "ok" {
                UserManager.shared.avatar = data.data?.avatar
            } else {
                self.view.makeToast(data.description)
            }
        }.catch { error in
            self.avatarSpinner.stopAnimating()
            self.view.makeToast("Что-то не так")
            print(error.localizedDescription)
        }
    }
    
    
    private func updateUser() {
        let fullName = (nameTextField.text ?? "") + " " + (secondNameTxetField.text ?? "") + " " + (patronomicTextField.text ?? "")
        
        let user = UpdatingUser(fullName: fullName, birthdate: selectedBirthDate, gender: selectedGender?.rawValue)
        spinner.startAniamtion()
        firstly {
            model.updateUser(user: user)
        }.done { data in
            if data.message?.lowercased() == "ok" {
                self.spinner.stopAnimation()
                self.performSegue(withIdentifier: "DocksViewController", sender: self)
                self.view.makeToast("Успешно")
            } else {
                self.spinner.stopAnimation()
                self.view.makeToast(data.description)
            }
        }.catch { error in
            self.spinner.stopAnimation()
            print(error.localizedDescription)
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
    
    private func chooseImagePicker(source: UIImagePickerController.SourceType, imagePicker: UIImagePickerController) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    @IBAction func changeAvatarButtonTapped(_ sender: Any) {
        presentCamera(picker: avatarPicker)
    }
    
    private func genderTextFieldTapped() {
        //present SelectGenderController
        guard let controller = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "SelectGenderController") as? SelectGenderController else { return }
        if let sheet = controller.sheetPresentationController {
            if #available(iOS 16.0, *) {
                sheet.detents = [
                   .custom { _ in
                       return 320 }]
            } else {
                sheet.detents = [.medium()]
            }
            sheet.prefersGrabberVisible = true
        }
        controller.delegate = self
        present(controller, animated: true)
        
   }
    
    private func chooseBirthDate() {
        guard let viewController = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "SelectBirthDateController") as? SelectBirthDateController else {
            return }
            if let sheet = viewController.sheetPresentationController {
                sheet.detents = [.medium()]
                sheet.prefersGrabberVisible = true
        }
         viewController.delegate = self
        viewController.setMinValue12 = true
         present(viewController, animated: true)
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
//MARK: - UITextFieldDelegate

extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == genderTxetField {
            genderTextFieldTapped()
            return false
        } else if textField == birthDateTextField {
            chooseBirthDate()
            return false
        } else {
            return true
        }
    }
}

//MARK: - SelectGenderControllerDelegate

extension ProfileViewController: SelectGenderControllerDelegate {
    func selectedGender(is gender: Gender?) {
        genderTxetField.text = gender?.ruTitleOfGender
        selectedGender = gender
    }
}

//MARK: - SelectBirthDateControllerDelegate

extension ProfileViewController: SelectBirthDateControllerDelegate {
    func selectedDateIs(date: Date?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        guard let date else { return }
        birthDateTextField.text = dateFormatter.string(from: date)
        selectedBirthDate = Int(date.timeIntervalSince1970)
    }
}
