//
//  PigiBankOffersTableViewCell.swift
//  hackathon2808
//
//  Created by Денис Чупров on 30.07.2023.
//

import Foundation
import UIKit

final class PigiBankOffersTableViewCell: UITableViewCell {
    static let reuseID = "PigiBankOffersTableViewCell"
    @IBOutlet private weak var bamkImageView: UIImageView!
    @IBOutlet private weak var titleOfPigiOffer: UILabel!
    @IBOutlet private weak var persentLabel: UILabel!
    @IBOutlet private weak var firstSumLabel: UILabel!
    @IBOutlet private weak var periodLabel: UILabel!
    @IBOutlet private weak var getOfferButton: UIButton!
    @IBOutlet private weak var backView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.addRadius()
        getOfferButton.addRadius()
    }
    
    func configure() {

    }
}
