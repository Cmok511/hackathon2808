//
//  Int + Extensions.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit

extension Int {
    
    var price: String? {
        let rubles: Int = self / 100
        let formatter = NumberFormatter()

        formatter.numberStyle = .decimal

        guard let formattedNum = formatter.string(from: NSNumber(value: rubles)) else { return nil }

        return formattedNum.replacingOccurrences(of: ",", with: " ") + " ₽"
    }
}

//MARK: UNIX TIME
typealias UnixTime = Int

extension UnixTime {
    private func formatType(form: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = form
        return dateFormatter
    }
    var dateFull: Date {
        return Date(timeIntervalSince1970: Double(self))
    }
    /// "HH"
    var toHour: String {
        return formatType(form: "HH").string(from: dateFull)
    }
    /// "HH:mm"
    var toHourAndMinute: String {
        return formatType(form: "HH:mm").string(from: dateFull)
    }
    /// dd.MM.yyyy
    var toDay: String {
        return formatType(form: "dd.MM.yyyy").string(from: dateFull)
    }
    ///"LLLL yyyy"
    var toMonth: String {
        return formatType(form: "LLLL yyyy").string(from: dateFull).capitalized
    }
}
