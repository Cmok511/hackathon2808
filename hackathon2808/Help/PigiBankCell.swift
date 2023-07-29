//
//  PigiBankCell.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit
final class PigiBankCell: UITableViewCell {
    static let reuseID = "PigiBankCell"
    
    @IBOutlet private weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.addRadius()
    }
}
