//
//  GosuslugiController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit
import WebKit

final class GosuslugiController: UIViewController, WKUIDelegate {
    
    
    var webView: WKWebView!
    
    override func loadView() {
           let webConfiguration = WKWebViewConfiguration()
           webView = WKWebView(frame: .zero, configuration: webConfiguration)
           webView.uiDelegate = self
           view = webView
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string:"https://esia.gosuslugi.ru/login/")
              let myRequest = URLRequest(url: myURL!)
              webView.load(myRequest)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5 , execute: {
            self.dismiss(animated: true)
        })
    }
}
