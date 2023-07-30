//
//  AppealsController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit
import Toast
import PromiseKit


final class AppealsController: BaseViewController {
    @IBOutlet private weak var tableView: UITableView!
    private let model = AppealsModel()
    
    private var bidsArray: [GettingBid] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllBids()
    }
    
    func getAllBids() {
        spinner.startAniamtion()
        firstly {
            model.getAllAppeals()
        }.done { data in
            self.spinner.stopAnimation()
            if data.message?.lowercased() == "ok" {
                self.bidsArray = data.data ?? []
            } else {
                self.view.makeToast(data.description)
            }
        }.catch { error in
            self.spinner.stopAnimation()
            print(error.localizedDescription)
            self.view.makeToast("Что-то пошло не так")
        }
    }
    
}
//MARK: - UITableViewDataSource

extension AppealsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bidsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppealsTableViewCell.reuseID, for: indexPath) as! AppealsTableViewCell
        cell.configure(bid: bidsArray[indexPath.row])
        return cell
    }
    
    
}
