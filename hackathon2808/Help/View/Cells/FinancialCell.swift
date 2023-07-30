//
//  FinancialCell.swift
//  hackathon2808
//
//  Created by Денис Чупров on 30.07.2023.
//

import Foundation
import UIKit
import SDWebImage

final class FinancialCell: UITableViewCell {
    static let reuseID = "FinancialCell"
    @IBOutlet private weak var bankImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var taskCountLabel: UILabel!
    @IBOutlet private weak var taskCount: UILabel!
    @IBOutlet private weak var contenetLabel: UILabel!
    
    func configure(help: GettingSupport) {
        titleLabel.text = help.title
        descriptionLabel.text = help.description
        taskCountLabel.text = "\(help.taskCount ?? 1)"
        taskCount.text = "\(help.lessonCount ?? 1)"
        contenetLabel.text = help.content
        
        
        if let image = help.bank?.icon {
            guard let imageUrl = URL(string: image) else { return }
            bankImage.sd_setImage(with: imageUrl)
        }
    }
}
