//
//  OnlineDiaryController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit



final class OnlineDiaryController: BaseViewController {
    
    @IBOutlet private weak var selectSchool: UITextField!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var selectSchoolButton: UIButton!
    @IBOutlet private weak var gosuslugiView: UIView!
    
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.addRadius()
        selectSchoolButton.addRadius()
        gosuslugiView.addRadius()
        gosuslugiView.addGreyBorder()
        gosuslugiView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gosuslugiTapped)))
    }
    
    @objc private func gosuslugiTapped() {
       
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GosuslugiController") as? GosuslugiController else {
            return
        }
        viewController.modalPresentationStyle = .overFullScreen
        self.present(viewController, animated: true)
    }
    
    
    @IBAction private func finishButtonTapped() {
       
    }
}
