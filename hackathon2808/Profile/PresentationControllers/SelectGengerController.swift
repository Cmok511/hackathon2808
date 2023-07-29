//
//  SelectGengerController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//


import Foundation
import UIKit

protocol SelectGenderControllerDelegate: AnyObject {
    func selectedGender(is gender: Gender?)
}

protocol SelectGenderControllerDelegateWithTag: AnyObject {
    func selectedGender(is gender: Gender?, tag: Int?)
}

final class SelectGenderController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!
    
    weak var delegate: SelectGenderControllerDelegate?
    weak var delegateForTag: SelectGenderControllerDelegateWithTag?
    private var selectedGender: Gender?
    private var selectIndex: Int = 0
    var tag: Int?
   
    //MARK: LifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    //for setting selected index
    func setSelectedIndex(index: Int) {
        selectIndex = index
    }
    
    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        saveButton.addRadius()
        cancelButton.addRadius()
    }
    //MARK: Actions
    @IBAction private func saveButtonTapped() {
        
        delegate?.selectedGender(is: Gender.allCases[selectIndex])
        delegateForTag?.selectedGender(is: Gender.allCases[selectIndex], tag: tag)
        dismiss(animated: true)
    }
    
    @IBAction private func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
}
//MARK: - UITableViewDataSource

extension SelectGenderController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Gender.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GenderTableViewCell.reuseID, for: indexPath) as! GenderTableViewCell
        cell.configure(title: Gender.allCases[indexPath.row].ruTitleOfGender)
      let image = indexPath.row == selectIndex ? UIImage(named: "radioButtonFill") : UIImage(named: "radioButton")
        cell.setImage(image: image)
        return cell
    }
}
//MARK: - UITableViewDelegate

extension SelectGenderController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectIndex = indexPath.row
        selectedGender = Gender.allCases[selectIndex]
        tableView.reloadData()
    }
}
