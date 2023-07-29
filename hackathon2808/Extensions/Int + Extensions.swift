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
