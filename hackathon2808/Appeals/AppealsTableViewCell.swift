//
//  AppealsTableViewCell.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit
import SDWebImage

final class AppealsTableViewCell: UITableViewCell {
    static let reuseID = "AppealsTableViewCell"
    
    @IBOutlet private weak var bankImageView: UIImageView!
    @IBOutlet private weak var numberOfAppealLabel: UILabel!
    @IBOutlet private weak var statusOfAppealLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(offer: GettingOffer?) {
        
        if let imageOfBank = offer?.bank?.icon {
            guard let url = URL(string: imageOfBank) else { return }
            bankImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            bankImageView.sd_setImage(with: url)
        }
    }
    
}
