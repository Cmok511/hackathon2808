//
//  LoginViewController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 28.07.2023.
//

import Foundation
import UIKit
import PromiseKit
import Toast


final class LoginViewController: BaseViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    private let model = InitModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        emailTextField.text = "denis"
        passwordTextField.text = "password"
    }
    
    private func setupUI() {
        nextButton.addRadius()
    }
    
    @IBAction private func enter() {
        if emailTextField.text == nil {
            view.makeToast("Введите логин", duration: 0.6)
            return
        }
        
        if passwordTextField.text == nil {
            view.makeToast("Введите пароль", duration: 0.6)
            return
        }
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespaces) else { return }
        guard let password = passwordTextField.text?.trimmingCharacters(in: .whitespaces) else { return }
        
        let body = EmailPasswordBody(email: email, password: password)
        spinner.startAniamtion()
        firstly {
            model.enterInApp(body: body)
        }.done { data in
            self.spinner.stopAnimation()
            if data.message?.lowercased() == "ok" {
                UserManager.shared.setNewValue(user: data.data?.user)
                NetworkManager.accessToken = data.data?.token
//                guard let viewController = UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else {
//                    return
//                }
//                viewController.modalPresentationStyle = .overFullScreen
//                self.present(viewController, animated: true)
                self.performSegue(withIdentifier: "WelcomeViewController", sender: self)
            } else  {
                self.view.makeToast(data.message, duration: 0.6)
            }
        }.catch { error in
            self.spinner.stopAnimation()
            print(error.localizedDescription)
            self.view.makeToast("Что- то пошло не так", duration: 0.6)
        }
        
        
        
        
    }
    
}
