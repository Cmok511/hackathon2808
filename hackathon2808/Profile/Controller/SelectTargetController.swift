//
//  SelectTargetController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 28.07.2023.
//

import Foundation
import UIKit
import PromiseKit
import Toast

final class SelectTargetController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var nextButton: UIButton!
    private let model = ProfileModel()
    private var felds: [GettingField] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    private func setupUI() {
        tableView.dataSource = self
        nextButton.addRadius()
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllFeeds()
    }
    
    
    private func getAllFeeds() {
        spinner.startAniamtion()
        firstly {
            model.getAllFeeds()
        }.done { data in
            if data.message?.lowercased() == "ok" {
                self.spinner.stopAnimation()
                self.spinner.stopAnimation()
                self.felds = data.data?.fields ?? []
            } else {
                self.spinner.stopAnimation()
                self.view.makeToast(data.description)
            }
        }.catch { error in
            self.spinner.stopAnimation()
            print(error.localizedDescription)
        }
    }
    
    
    
    @IBAction func goToSelectTarget(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func goToTabBar(_ sender: UIButton) {
        guard let viewController = UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else {
            return
        }
        viewController.modalPresentationStyle = .overFullScreen
        self.present(viewController, animated: true)
    }
    
    
}
extension SelectTargetController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return felds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TargetProfileTableCell.reuseID, for: indexPath) as! TargetProfileTableCell
        cell.configure(feld: felds[indexPath.row])
        return cell
    }
}
