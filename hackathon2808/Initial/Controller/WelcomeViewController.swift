//
//  WelcomeViewController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit
import WebKit

final class WelcomeViewController: BaseViewController {
    
    
    @IBOutlet private weak var gususlugiView: UIView!
    @IBOutlet private weak var skipButton: UIButton!
    @IBOutlet private weak var enterButton: UIButton!
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        skipButton.addRadius()
        enterButton.addRadius()
        gususlugiView.addRadius()
        gususlugiView.addGreyBorder()
        gususlugiView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gosuslugiTapped)))
    }
    
    @objc private func gosuslugiTapped() {
       
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GosuslugiController") as? GosuslugiController else {
            return
        }
        viewController.modalPresentationStyle = .overFullScreen
        self.present(viewController, animated: true)
    }
    
    @IBAction private func skipTaped() {
        guard let viewController = UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else {
            return
        }
        viewController.modalPresentationStyle = .overFullScreen
        self.present(viewController, animated: true)
    }
    
    @IBAction private func nextTaped() {
        guard let viewController = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
