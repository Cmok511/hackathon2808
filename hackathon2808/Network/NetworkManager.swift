//
//  NetworkManager.swift
//  hackathon2808
//
//

import Foundation
import KeychainAccess

final class NetworkManager {
   
    private static let keychain = Keychain(service: "hackathon2808")
 
    static var accessToken: String? {
        get {
            return keychain["accessToken"]
        } set {
            do {
                try keychain.set(newValue ?? "", key: "accessToken")
            } catch {
                print("something wrong with the token installation")
            }
        }
    }
    
    static let baseURLString = "http://10.2.0.23:90"
}

