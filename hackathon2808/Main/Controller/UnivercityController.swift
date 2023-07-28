//
//  UnivercityController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 28.07.2023.
//

import Foundation
import UIKit
import SDWebImage

final class UnivercityController: BaseViewController {
    
    private enum TableSections: Int, CaseIterable {
        case image
        case info
        case faculty
    }
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        tableView.dataSource = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    @objc private func aboutFacultyButtonTapped() {
        print("aboutFacultyButtonTapped")
        guard let viewController = UIStoryboard(name: "Offers", bundle: nil).instantiateViewController(withIdentifier: "AboutFacultyViewController") as? AboutFacultyViewController else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
//MARK: - UITableViewDataSource
extension UnivercityController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        TableSections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch TableSections.allCases[section] {
        case .image:
            return 1
        case .info:
            return 1
        case .faculty:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch TableSections.allCases[indexPath.section] {
        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.reuseID, for: indexPath) as! ImageCell
            return cell
        case .info:
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.reuseID, for: indexPath) as! DescriptionCell
            return cell
        case .faculty:
            let cell = tableView.dequeueReusableCell(withIdentifier: FacultyCell.reuseID, for: indexPath) as! FacultyCell
            cell.aboutButton.addTarget(self, action: #selector(aboutFacultyButtonTapped), for: .touchUpInside)
            return cell
        }
    }
}
