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
    
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.addRadius()
        selectSchoolButton.addRadius()
    }
    
    
    @IBAction private func finishButtonTapped() {
       
    }
}
