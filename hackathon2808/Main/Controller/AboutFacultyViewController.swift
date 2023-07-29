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
    }
    
    @IBAction func sendAppeal(_ sender: UIButton) {
        self.view.makeToast("Заявление отправлено")
    }
    
}
