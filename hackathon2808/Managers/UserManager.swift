//
//  UserManager.swift
//  hackathon2808
//
//  Created by Денис Чупров on 28.07.2023.
//

import Foundation

final class UserManager {
    
    static let shared = UserManager()
    private init(){}
    
    var avatar: String? {
        get {
            return UserDefaults.standard.string(forKey: "avatar")
        } set {
            UserDefaults.standard.set(newValue, forKey: "avatar")
        }
    }
}
