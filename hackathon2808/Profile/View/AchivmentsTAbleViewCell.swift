//
//  AchivmentsTAbleViewCell.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit


final class AchivmentsTAbleViewCell: UITableViewCell {
    static let reuseID = "AchivmentsTAbleViewCell"
    
    @IBOutlet weak var achivmentImageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var backView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.addRadius()
        achivmentImageView.addRadius()
    }
}

