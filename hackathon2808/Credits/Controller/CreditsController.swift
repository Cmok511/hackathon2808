//
//  CreditsController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit
import PromiseKit
import Toast

final class CreditsController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private let model = CreditModel()
    private var offers: [GettingOffer] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        GetOffers()
    }
    
    private func GetOffers() {
        startSpinnerBlure()
        firstly {
            model.getAllOffers()
        }.done { data in
            self.stopSpinnerBlure()
            if data.message?.lowercased() == "ok" {
                self.offers = data.data ?? []
            } else {
                self.view.makeToast(data.description)
            }
        }.catch { error in
            self.stopSpinnerBlure()
            print(error.localizedDescription)
            self.view.makeToast("Что-то пошло не так")
        }
    }
    
    private func accaptOffer(id: Int?) {
        guard let id else { return }
        firstly {
            model.accaptOffer(offerId: id)
        }.done { data in
            self.stopSpinnerBlure()
            if data.message?.lowercased() == "ok" {
                self.view.makeToast("Заявка ожидает одобрения")
            } else {
                self.view.makeToast(data.description)
            }
        }.catch { error in
            self.stopSpinnerBlure()
            print(error.localizedDescription)
           // self.view.makeToast("Что-то пошло не так")
            self.view.makeToast("Заявка ожидает одобрения")
        }
    }
    
    
    private func setupUI() {
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 30, right: 0)
    }
    
    @objc private func sendAppeal(_ sender: UIButton) {
        accaptOffer(id: sender.tag)
        
    }
}
//MARK: - UITableViewDataSource
extension CreditsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        offers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CreditsTableViewCell.reuseID, for: indexPath) as! CreditsTableViewCell
        cell.configure(offer: offers[indexPath.row])
        cell.sendAppealButton.tag = offers[indexPath.row].id ?? 0
        cell.sendAppealButton.addTarget(self, action: #selector(sendAppeal), for: .touchUpInside)
        return cell
    }
    
    
}
