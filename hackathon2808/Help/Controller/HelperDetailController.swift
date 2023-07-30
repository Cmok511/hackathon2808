//
//  HelperDetailController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 30.07.2023.
//

import Foundation
import UIKit
import PromiseKit
import Toast

enum HelperDetailControllerState {
    case financial
    case univer
    case test
}

final class HelperDetailController: BaseViewController {
    
    var state: HelperDetailControllerState = .financial
    
    private var helpArray: [GettingSupport] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet private weak var tableView: UITableView!
    private let model = HelpModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        switch state {
        case .financial:
            getFinSupport()
        case .univer:
            getUniver()
        case .test:
            getTests()
        }
    }
    
    
    private func getFinSupport() {
        startSpinnerBlure()
        firstly {
            model.getFinSupport()
        }.done { data in
            self.stopSpinnerBlure()
            if data.message?.lowercased() == "ok" {
                self.helpArray = data.data ?? []
            } else {
                self.view.makeToast(data.description)
            }
        }.catch { error in
            self.stopSpinnerBlure()
            print(error.localizedDescription)
            self.view.makeToast("Что-то пошло не так")
        }
    }
    
    private func getUniver() {
        startSpinnerBlure()
        firstly {
            model.getUniver()
        }.done { data in
            self.stopSpinnerBlure()
            if data.message?.lowercased() == "ok" {
                self.helpArray = data.data ?? []
            } else {
                self.view.makeToast(data.description)
            }
        }.catch { error in
            self.stopSpinnerBlure()
            print(error.localizedDescription)
            self.view.makeToast("Что-то пошло не так")
        }
    }
    
    
    private func getTests() {
        startSpinnerBlure()
        firstly {
            model.getTests()
        }.done { data in
            self.stopSpinnerBlure()
            if data.message?.lowercased() == "ok" {
                self.helpArray = data.data ?? []
            } else {
                self.view.makeToast(data.description)
            }
        }.catch { error in
            self.stopSpinnerBlure()
            print(error.localizedDescription)
            self.view.makeToast("Что-то пошло не так")
        }
    }
    
    
    
    
}

//MARK: - UITableViewDataSource
extension HelperDetailController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        helpArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch state {
        case .financial:
            let cell = tableView.dequeueReusableCell(withIdentifier: FinancialCell.reuseID, for: indexPath) as! FinancialCell
            cell.configure(help: helpArray[indexPath.row])
            return cell
        case .univer:
            let cell = tableView.dequeueReusableCell(withIdentifier: UnivarTableViewCell.reuseID, for: indexPath) as! UnivarTableViewCell
            cell.configure(help: helpArray[indexPath.row])
            return cell
        case .test:
            let cell = tableView.dequeueReusableCell(withIdentifier: TestTableViewCell.reuseID, for: indexPath) as! TestTableViewCell
            cell.configure(help: helpArray[indexPath.row])
            return cell
        }
    }
    
    
}
