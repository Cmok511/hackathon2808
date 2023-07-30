//
//  HelpViewController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit

final class HelpViewController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK:  viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}
//MARK: - UITableViewDataSource

extension HelpViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PigiBankCell.reuseID, for: indexPath) as! PigiBankCell
            return cell
        } else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: HelpTableViewCell.reuseID, for: indexPath) as! HelpTableViewCell
            return cell
        }
    }
}
//MARK: - UITableViewDelegate

extension HelpViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "showPigiBankOffersController", sender: self)
        }
    }
}
