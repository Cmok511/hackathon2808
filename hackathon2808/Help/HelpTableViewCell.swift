//
//  HelpTableViewCell.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit
final class HelpTableViewCell: UITableViewCell {
    static let reuseID = "HelpTableViewCell"
    
    @IBOutlet private weak var titleImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.addRadius16()
    }
}
