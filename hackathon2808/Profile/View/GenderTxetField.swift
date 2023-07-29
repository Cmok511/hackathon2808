//
//  GenderTxetField.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit

final class GenderTableViewCell: UITableViewCell {
    static let reuseID = "GenderTableViewCell"
    
    @IBOutlet private weak var radioButton: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
    func setImage(image: UIImage?) {
        radioButton.image = image
    }
}

