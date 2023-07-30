//
//  HelpViewController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit
import PromiseKit
import Toast

final class HelpViewController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private let model = HelpModel()
    //MARK:  viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}
//MARK: - UITableViewDataSource

extension HelpViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: PigiBankCell.reuseID, for: indexPath) as! PigiBankCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: HelpTableViewCell.reuseID, for: indexPath) as! HelpTableViewCell
            cell.configure(help: model.fin)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: HelpTableViewCell.reuseID, for: indexPath) as! HelpTableViewCell
            cell.configure(help: model.prepere)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: HelpTableViewCell.reuseID, for: indexPath) as! HelpTableViewCell
            cell.configure(help: model.test)
            return cell
        default: return UITableViewCell()
        }
    }
}

//MARK: - UITableViewDelegate

extension HelpViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "showPigiBankOffersController", sender: self)
        }
        if indexPath.row == 1 {
            guard let viewController = UIStoryboard(name: "Help", bundle: nil).instantiateViewController(withIdentifier: "HelperDetailController") as? HelperDetailController else {
                return
            }
            viewController.state = .financial
            navigationController?.pushViewController(viewController, animated: true)
        }
        
        if indexPath.row == 2 {
            guard let viewController = UIStoryboard(name: "Help", bundle: nil).instantiateViewController(withIdentifier: "HelperDetailController") as? HelperDetailController else {
                return
            }
            viewController.state = .univer
            navigationController?.pushViewController(viewController, animated: true)
        }
        
        if indexPath.row == 3 {
            guard let viewController = UIStoryboard(name: "Help", bundle: nil).instantiateViewController(withIdentifier: "HelperDetailController") as? HelperDetailController else {
                return
            }
            viewController.state = .test
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
