//
//  UniversityCell.swift
//  hackathon2808
//
//  Created by Денис Чупров on 28.07.2023.
//

import Foundation
import UIKit
import SDWebImage

final class UniversityCell: UITableViewCell {
    static let reuseID = "UniversityCell"
    
    @IBOutlet private weak var imageUniver: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var facultyLabel: UILabel!
    @IBOutlet weak var avgMarkLabel: UILabel!
    
    @IBOutlet private weak var backView: UIView!
    @IBOutlet weak var moreInfoButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        moreInfoButton.addRadius()
        backView.addRadius()
        
    }
    
    func configure(faculty: GettingFaculty) {
        priceLabel.text = faculty.name
        avgMarkLabel.text = "Средний проходной балл \(faculty.avgMark ?? 0)"
        titleLabel.text = faculty.university?.name
        facultyLabel.text = faculty.description
        addressLabel.text = faculty.university?.city?.name
        if let urlString =  faculty.university?.photo {
            guard let image = URL(string: urlString) else { return }
            imageUniver.sd_imageIndicator = SDWebImageActivityIndicator.gray
            imageUniver.sd_setImage(with: image)
        }
    }
    
    
}

