//
//  TestTableViewCell.swift
//  hackathon2808
//
//  Created by Денис Чупров on 30.07.2023.
//

import Foundation
import UIKit

final class TestTableViewCell: UITableViewCell {
    static let reuseID = "TestTableViewCell"
    
    @IBOutlet private weak var univerNameLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var contentLabel: UILabel!
    
    func configure(help: GettingSupport?) {
        univerNameLabel.text = help?.university?.name
        titleLabel.text = help?.title
        contentLabel.text = help?.content
        
    }
}
