//
//  ResumeController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 30.07.2023.
//

import Foundation
import UIKit

protocol ResumeControllerDelegate: AnyObject {
    func sendResume(text: String?)
}

final class  ResumeController: BaseViewController {
    
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var send: UIButton!
    @IBOutlet private weak var cancel: UIButton!
    
    weak var delegate: ResumeControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.addGreyBorder()
        textView.addRadius()
        send.addRadius()
        cancel.addRadius()
    }
    
    @IBAction private func cancelTapped() {
        dismiss(animated: true)
    }
    
    @IBAction private func sendButton() {
        dismiss(animated: true) {
            self.delegate?.sendResume(text: self.textView.text)
        }
    }
}
