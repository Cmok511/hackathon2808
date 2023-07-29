//
//  TargetProfileTableCell.swift
//  hackathon2808
//
//  Created by Денис Чупров on 28.07.2023.
//

import Foundation
import UIKit

final class TargetProfileTableCell: UITableViewCell {
    static let reuseID = "TargetProfileTableCell"
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var deleteButton: UIButton!
    @IBOutlet private weak var backView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.addGreyBorder()
        backView.addRadius()
        
    }
}
