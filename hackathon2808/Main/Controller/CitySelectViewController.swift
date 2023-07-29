//
//  CitySelectViewController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//


import Foundation
import UIKit

enum СitySelectIs {
    case residenceCity
    case birthCity
}

protocol SelectCityControllerDelegate: AnyObject {
    func selected(_ value: City)
}


final class SelectCityController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var allCities: [City]
    
    //MARK: viewDidLoad
    
    weak var delegate: SelectCityControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //MARK:  Inits
    
    init?(coder: NSCoder, allCitiesArray: [City]) {
        self.allCities = allCitiesArray
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
//MARK: - UITableViewDataSource

extension SelectCityController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.reuseID) as! CityTableViewCell
        cell.configure(title: allCities[indexPath.row].name)
        return cell
    }
    
}

//MARK: - UITableViewDelegate

extension SelectCityController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            dismiss(animated: true)
        }
        let selectedCity = allCities[indexPath.row]
        delegate?.selected(selectedCity)
    }
}
