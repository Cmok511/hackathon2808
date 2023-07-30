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
    
    
    @IBOutlet weak var backView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.addRadius()
    }
    
    func configure(bid: GettingBid?) {
        
        numberOfAppealLabel.text = "Заявка номер \(bid?.id ?? 0)"
        switch bid?.isAccepted {
        case true :
            numberOfAppealLabel.text = "Заявка одобрена"
            numberOfAppealLabel.textColor = UIColor(named: "OnlineColor")
        case false :
            numberOfAppealLabel.text = "Заявка отклонена"
            numberOfAppealLabel.textColor = UIColor(named: "LightTextColor")
        case .none:
            numberOfAppealLabel.text = "Ожидание ответа"
            numberOfAppealLabel.textColor = UIColor(named: "TextColor")
        case .some(_):
            numberOfAppealLabel.text = "Ожидание ответа"
        }
        
        if let imageOfBank = bid?.offer?.bank?.icon {
            guard let url = URL(string: imageOfBank) else { return }
            bankImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            bankImageView.sd_setImage(with: url)
        }
    }
    
}
