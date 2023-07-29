//
//  DescriptionCell.swift
//  hackathon2808
//
//  Created by Денис Чупров on 28.07.2023.
//

import Foundation
import UIKit

final class DescriptionCell: UITableViewCell {
    static let reuseID = "DescriptionCell"
    @IBOutlet private weak var titleLable: UILabel!
    @IBOutlet private weak var facultyLable: UILabel!
    @IBOutlet private weak var avgMarkLabel: UILabel!
    @IBOutlet private weak var descripitionLabel: UILabel!
    
    
    func configure(faculty: GettingFaculty?) {
        titleLable.text = faculty?.university?.name
        facultyLable.text = faculty?.name
        avgMarkLabel.text = "Средний проходной балл \(faculty?.avgMark ?? 0)"
        descripitionLabel.text = faculty?.description
    }
    
}
