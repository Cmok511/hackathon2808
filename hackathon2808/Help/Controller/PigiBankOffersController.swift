//
//  PigiBankOffersController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 30.07.2023.
//

import Foundation
import UIKit

final class PigiBankOffersController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 30, right: 0)
    }
}
//MARK: - UITableViewDataSource

extension PigiBankOffersController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PigiBankOffersTableViewCell.reuseID, for: indexPath) as! PigiBankOffersTableViewCell
        return cell
    }
    
    
}
