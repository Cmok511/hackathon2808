//
//  FacultyCell.swift
//  hackathon2808
//
//  Created by Денис Чупров on 28.07.2023.
//

import Foundation
import UIKit

final class FacultyCell: UITableViewCell {
    static let reuseID = "FacultyCell"
    
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet private weak var addTargetButton: UIButton!
    @IBOutlet private weak var avgMarkLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var backView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addTargetButton.addRadius()
        backView.addRadius()
    }
    
    
    func configure(field: GettingField?) {
        descriptionLabel.text = field?.name
        priceLabel.text = field?.price?.price
        avgMarkLabel.text = "Средний проходной балл \(field?.minMark ?? 0)"
    }
}
