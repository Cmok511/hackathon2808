//
//  FilterController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit

protocol FilterControllerDelegate: AnyObject {
    func newData()
}

final class FilterController: BaseViewController {
   
    private var selectedCity: City?
    private var sumFrom: Int?
    private var sumTo: Int?
    
    @IBOutlet weak var cancelbtn: UIButton!
    @IBOutlet weak var confurmbtn: UIButton!
   
    private let allCities = [City(name: "Краснодар", id: 1),
                             City(name: "Москва", id: 2),
                             City(name: "Санкт-Петербург", id: 3)]
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var sumFromTextField: UITextField!
    @IBOutlet weak var sumToTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelbtn.addRadius()
        confurmbtn.addRadius()
        cityTextField.delegate = self
    }
    
    
    weak var delegate: FilterControllerDelegate?
    
    private func selectCity() {
        let viewController = UIStoryboard(name: "Offers", bundle: nil).instantiateViewController(identifier: "SelectCityController", creator: { coder in
            SelectCityController(coder: coder, allCitiesArray: self.allCities)
         })
         if let sheet = viewController.sheetPresentationController {
             sheet.detents = [.medium()]
             sheet.prefersGrabberVisible = true
     }
         viewController.delegate = self
         present(viewController, animated: true)
    }
    
    @IBAction private func cancelButton() {
        navigationController?.popViewController(animated: true)
    }
    @IBAction private func confurmButton() {
        
        if sumFromTextField.text != "" {
            guard let sumFromSting = sumFromTextField.text else { return }
            sumFrom = Int(sumFromSting)
        }
        
        if sumToTextField.text != "" {
            guard let sumToSting = sumToTextField.text else { return }
            sumTo = Int(sumToSting)
        }
        
        
        
        navigationController?.popViewController(animated: true)
    }
}
//MARK: - SelectCityControllerDelegate

extension FilterController: SelectCityControllerDelegate {
    func selected(_ value: City) {
        selectedCity = value
        cityTextField.text = selectedCity?.name
    }
}
extension FilterController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == cityTextField {
            selectCity()
            return false
        } else {
            return true
        }
    }
}
