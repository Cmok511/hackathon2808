//
//  CreditsTableViewCell.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit
import SDWebImage

final class CreditsTableViewCell: UITableViewCell {
    static let reuseID = "CreditsTableViewCell"
    
    @IBOutlet private weak var bankImage: UIImageView!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var titleOfCreditLAbel: UILabel!
    @IBOutlet private weak var summLabel: UILabel!
    @IBOutlet private weak var payLabel: UILabel!
    @IBOutlet private weak var termLabel: UILabel!
    @IBOutlet  weak var sendAppealButton: UIButton!
    @IBOutlet private weak var backView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sendAppealButton.addRadius()
        backView.addRadius()
    }
    
    
    func configure(offer: GettingOffer?) {
        titleOfCreditLAbel.text = offer?.title
        priceLabel.text = offer?.maxPrice?.price
        summLabel.text = offer?.minPrice?.price
        payLabel.text = offer?.annualPayment?.price
        termLabel.text = "до \(offer?.paymentTerm ?? 1) лет"
        
        if let icon = offer?.bank?.icon {
            guard let url = URL(string: icon) else { return }
            bankImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
            bankImage.sd_setImage(with: url)
        }
    }
}
