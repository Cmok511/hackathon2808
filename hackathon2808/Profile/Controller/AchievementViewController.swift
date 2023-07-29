//
//  AchievementViewController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit

final class AchievementViewController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet internal weak var nextButton: UIButton!
    
    private var achivmentsArray: [AchivmentsHelper] = [] {
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
    }
    
    
    @IBAction private func addAchivmentButtonTapped() {
        guard let viewController = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "PopupAchivmentController") as? PopupAchivmentController else {
            return
        }
        viewController.delegate = self
        viewController.modalPresentationStyle = .popover
        let popoverVC = viewController.popoverPresentationController
        popoverVC?.delegate = self
        popoverVC?.sourceView = self.view
        viewController.preferredContentSize = .init(width: 343, height: 280)
        popoverVC?.permittedArrowDirections = []
        self.present(viewController, animated: true)
    }
}
//MARK: - UITableViewDataSource
extension AchievementViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        achivmentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AchivmentsTAbleViewCell.reuseID, for: indexPath) as! AchivmentsTAbleViewCell
        cell.textField.text = achivmentsArray[indexPath.row].title
        cell.achivmentImageView.image = achivmentsArray[indexPath.row].image
        return cell
    }
}


//MARK: - PopupAchivmentControllerDelagate

extension AchievementViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        .none
    }
}
//MARK: - PopupAchivmentControllerDelagate

extension AchievementViewController: PopupAchivmentControllerDelagate {
    func selectedAchivment(title: String?, image: UIImage?) {
        achivmentsArray.append(AchivmentsHelper(image: image, title: title))
    }
}
