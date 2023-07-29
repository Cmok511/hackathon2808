//
//  AppealsController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit

final class AppealsController: BaseViewController {
    @IBOutlet private weak var tableView: UITableView!
    private var offers: [GettingOffer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}
//MARK: - UITableViewDataSource

extension AppealsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        offers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppealsTableViewCell.reuseID, for: indexPath) as! AppealsTableViewCell
        cell.configure(offer: offers[indexPath.row])
        return cell
    }
    
    
}
