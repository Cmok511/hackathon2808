//
//  CityTableViewCell.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit

final class CityTableViewCell: UITableViewCell {
    static let reuseID = "CityTableViewCell"
    @IBOutlet private weak var cityLtleLabel: UILabel!
    
    //configure cell
    func configure(title: String?) {
        cityLtleLabel.text = title
    }
    
}
