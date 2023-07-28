//
//  UniversityCell.swift
//  hackathon2808
//
//  Created by Денис Чупров on 28.07.2023.
//

import Foundation
import UIKit

final class UniversityCell: UITableViewCell {
    static let reuseID = "UniversityCell"
    
    @IBOutlet private weak var imageUniver: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var facultyLabel: UILabel!
    
    @IBOutlet weak var moreInfoButton: UIButton!
    
    
    func configure() {
        
    }
    
    
}

