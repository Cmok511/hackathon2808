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
    
    
    var id: Int? {
        get {
            return UserDefaults.standard.integer(forKey: "id")
        } set {
            UserDefaults.standard.set(newValue, forKey: "id")
        }
    }
    
    var tel: String? {
        get {
            return UserDefaults.standard.string(forKey: "tel")
        } set {
            UserDefaults.standard.set(newValue, forKey: "tel")
        }
    }
    
    
    var email: String? {
        get {
            return UserDefaults.standard.string(forKey: "email")
        } set {
            UserDefaults.standard.set(newValue, forKey: "email")
        }
    }
    
    var fullName: String? {
        get {
            return UserDefaults.standard.string(forKey: "fullName")
        } set {
            UserDefaults.standard.set(newValue, forKey: "fullName")
        }
    }
    
    
    func setNewValue(user: GettingUser?) {
        fullName = user?.fullName
        email = user?.email
        id = user?.id
        tel = user?.tel
    }
    
}
