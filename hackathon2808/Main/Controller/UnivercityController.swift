//
//  UnivercityController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 28.07.2023.
//

import Foundation
import UIKit
import SDWebImage
import PromiseKit
import Toast

final class UnivercityController: BaseViewController {
   
    private let model = MainModel()
    
    private enum TableSections: Int, CaseIterable {
        case image
        case info
        case faculty
    }
    //MARK: open
    var facultyId: Int?
    //
    
    private var faculty: GettingFaculty? {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getFaculty()
    }

    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //MARK: getFaculty
    private func getFaculty() {
        guard let facultyId else {
            self.view.makeToast("нет id")
            return}
        startSpinnerBlure()
        firstly {
            model.getFacultyWith(facultyId: facultyId)
        }.done { data in
            if data.message?.lowercased() == "ok" {
                self.faculty = data.data
                self.title = self.faculty?.name
                self.stopSpinnerBlure()
            } else {
                self.spinner.stopAnimation()
                self.view.makeToast(data.description)
            }
        }.catch { error in
            self.stopSpinnerBlure()
            self.view.makeToast("Что-то пошло не так")
            self.view.makeToast(error.localizedDescription)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    @objc private func aboutFacultyButtonTapped(index: Int) {
        print("aboutFacultyButtonTapped")
        guard let viewController = UIStoryboard(name: "Offers", bundle: nil).instantiateViewController(withIdentifier: "AboutFacultyViewController") as? AboutFacultyViewController else {
            return
        }
        viewController.field = faculty?.fields?[index]
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
            return faculty?.fields?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch TableSections.allCases[indexPath.section] {
        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.reuseID, for: indexPath) as! ImageCell
            cell.configure(faculty: faculty)
            return cell
        case .info:
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.reuseID, for: indexPath) as! DescriptionCell
            cell.configure(faculty: faculty)
            return cell
        case .faculty:
            let cell = tableView.dequeueReusableCell(withIdentifier: FacultyCell.reuseID, for: indexPath) as! FacultyCell
            cell.configure(field: faculty?.fields?[indexPath.row])
            return cell
        }
    }
}
//MARK: - UITableViewDelegate

extension UnivercityController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch TableSections.allCases[indexPath.section] {
        case .image: break
        case .info: break
        case .faculty:
            aboutFacultyButtonTapped(index: indexPath.row)
        }
    }
}
