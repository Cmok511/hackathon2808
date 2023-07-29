//
//  BirthDateController.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//



import Foundation
import UIKit

protocol SelectBirthDateControllerDelegate: AnyObject {
    func selectedDateIs(date: Date?)
}

protocol SelectBirthDateControllerDelegateTag: AnyObject {
    func selectedDateIs(date: Date?, tag: Int?)
}

final class SelectBirthDateController: UIViewController {
    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var datePicker: UIDatePicker!
    private var selectedDate: Date?
    weak var delegate: SelectBirthDateControllerDelegate?
    weak var delegateWithTag: SelectBirthDateControllerDelegateTag?
    var tag: Int?
    var setMinValue12: Bool? = false
    var minValueCurrenDate: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        if setMinValue12 ?? false {
            datePicker.set12YearValidation()
            
        }
        if minValueCurrenDate {
            datePicker.setMinCurrentDateValue()
        }
            
        saveButton.addRadius()
        cancelButton.addRadius()
        datePicker.addTarget(self, action: #selector(getSelectedDate), for: .valueChanged)
        datePicker.setValue(UIColor(named: "AccentColor"), forKey: "textColor")
        datePicker.timeZone = .current
    }
    
    @objc private func getSelectedDate() {
        selectedDate = datePicker.date
    }
    
    
    @IBAction private func saveButtonTapped() {
        defer {
            dismiss(animated: true)
        }
        guard let selectedDate else { return }
        delegate?.selectedDateIs(date: selectedDate)
        delegateWithTag?.selectedDateIs(date: selectedDate, tag: tag)
    }
    
    
    @IBAction private func cancelButtonTapped() {
        dismiss(animated: true)
    }
}
