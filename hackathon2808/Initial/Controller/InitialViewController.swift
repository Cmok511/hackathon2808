//
//  ViewController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 28.07.2023.
//

import UIKit

class InitialViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.performSegue(withIdentifier: "LoginViewController", sender: self)
        })
    }
}
