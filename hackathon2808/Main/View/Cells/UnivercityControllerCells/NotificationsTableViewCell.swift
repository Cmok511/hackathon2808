//
//  NotificationsTableViewCell.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit
final class NotificationsTableViewCell: UITableViewCell {
    static let reuseID = "NotificationsTableViewCell"
    
    @IBOutlet private weak var daleLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var textNotifificationsLabel: UILabel!
    @IBOutlet private weak var backView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.addRadius()
    }
    func configure() {
        
    }
    
}
