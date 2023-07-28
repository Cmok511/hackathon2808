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
}
