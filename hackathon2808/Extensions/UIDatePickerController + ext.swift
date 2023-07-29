//
//  UIDatePickerController + ext.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit

extension UIDatePicker {
 
    func set12YearValidation() {
        let currentDate: Date = Date()
        var calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(identifier: "UTC")!
        var components: DateComponents = DateComponents()
        components.calendar = calendar
        components.year = -12
        let maxDate: Date = calendar.date(byAdding: components, to: currentDate)!
        components.year = -150
        let minDate: Date = calendar.date(byAdding: components, to: currentDate)!
        self.minimumDate = minDate
        self.maximumDate = maxDate
    }

func setMinCurrentDateValue() {
    let currentDate: Date = Date()
    var calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    calendar.timeZone = TimeZone(identifier: "UTC")!
    var components: DateComponents = DateComponents()
    components.calendar = calendar
    components.year = 0
    let maxDate: Date = calendar.date(byAdding: components, to: currentDate)!
    components.year = -150
    let minDate: Date = calendar.date(byAdding: components, to: currentDate)!
    self.minimumDate = minDate
    self.maximumDate = maxDate
}
}
