//
//  BaseViewController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 28.07.2023.
//

import Foundation
import UIKit
import PromiseKit
import IQKeyboardManagerSwift

class BaseViewController: UIViewController {
    
    let spinner = Spinner()
   
    private let blureView: UIView = {
        let blureView = UIView()
        blureView.translatesAutoresizingMaskIntoConstraints = false
        blureView.backgroundColor = UIColor(named: "BackgroundColor")
        blureView.isHidden = true
        blureView.layer.zPosition = 1
        return blureView
    }()
    
    func showBlureView() {
        blureView.isHidden = false
        UIView.animate(withDuration: 0.1) {
            self.blureView.alpha = 1
        }
    }
    
    func hideBlureView() {
        UIView.animate(withDuration: 0.2, delay: 0.025) {
            self.blureView.alpha = 0
        } completion: { _ in
            self.blureView.isHidden = true
            self.blureView.alpha = 1
        }
    }
    
     func startSpinnerBlure() {
        spinner.startAniamtion()
        showBlureView()
    }
    
    func stopSpinnerBlure() {
        spinner.stopAnimation()
        hideBlureView()
    }
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        IQKeyboardManager.shared.enable = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //set color in tavigationcontroller title
        self.navigationController?.navigationBar.standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(named: "TextColor") ?? .black]
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func configure() {
        spinner.layer.zPosition = 1
        view.addSubview(blureView)
        view.addSubview(spinner)
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            blureView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blureView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blureView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            blureView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
