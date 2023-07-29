//
//  Constants.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation

//MARK: Gender
enum Gender: Int, CaseIterable {
    case male   = 0
    case female = 1
    
    var ruTitleOfGender: String {
        switch self {
        case .male: return "Мужской"
        case .female: return "Женский"
        }
    }
}
