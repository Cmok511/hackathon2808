//
//  AboutFacultyViewController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 28.07.2023.
//

import Foundation
import UIKit
import Toast

final class AboutFacultyViewController: BaseViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var avgMarkLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var descriptionLAbel: UILabel!
    
    @IBOutlet weak var addTargetButton: UIButton!
    
    @IBOutlet weak var sendApealButton: UIButton!
    
    var field: GettingField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addTargetButton.addRadius()
        sendApealButton.addRadius()
    }
    
    private func configure() {
        titleLabel.text = field?.name
        avgMarkLabel.text = "Средний проходной балл \(field?.minMark ?? 0)"
        priceLabel.text = field?.price?.price
        descriptionLAbel.text = field?.description
        
        if field?.isSelected ?? false {
            addTargetButton.backgroundColor = UIColor(named: "BackgroundColor")
            addTargetButton.tintColor = UIColor(named: "TextColor")
            addTargetButton.setTitle("Направление добавлено", for: .normal)
            addTargetButton.addGreyBorder()
        } else {
            addTargetButton.removeBorder()
            addTargetButton.setTitle("Добавить направление", for: .normal)
            addTargetButton.backgroundColor = UIColor(named: "AccentColor")
            addTargetButton.tintColor = UIColor(named: "WhiteColor")
        }
    }
    
    @IBAction func sendAppeal(_ sender: UIButton) {
        //present SelectGenderController
        guard let controller = UIStoryboard(name: "Offers", bundle: nil).instantiateViewController(withIdentifier: "ResumeController") as? ResumeController else { return }
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
    
}
extension AboutFacultyViewController: ResumeControllerDelegate {
    func sendResume(text: String?) {
        self.view.makeToast("Заявление отправлено")
    }
}
