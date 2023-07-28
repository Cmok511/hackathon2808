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
        UserManager.shared.avatar = "https://avatars.mds.yandex.net/i?id=a36040571e4af7c7eca1adb51058db523294dd96-8436979-images-thumbs&n=13"
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            guard let viewController = UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else {
                return
            }
            viewController.modalPresentationStyle = .overFullScreen
            self.present(viewController, animated: true)
        })
    }
}
