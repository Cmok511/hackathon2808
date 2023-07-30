//
//  MainModel.swift
//  hackathon2808
//
//  Created by Денис Чупров on 28.07.2023.
//

import Foundation
import PromiseKit

final class InitModel {
    
    //MARK: enterInApp
    func enterInApp(body: EmailPasswordBody) -> Promise<DApi<TokenWithUser>> {
        let utlString = NetworkManager.baseURLString + "/api/sign-in/email-password/"
        let url = URL(string: utlString)!
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let data = try! encoder.encode(body)
        return CoreNetwork.request(method: .POST(url: url, body: data))
    }
    
}

struct EmailPasswordBody: Encodable {
    let email: String?
    let password: String?
}


struct TokenWithUser: Codable {
    let user: GettingUser?
    let token: String?
}

struct GettingUser: Codable {
    let email: String?
    let tel: String?
    let isActive: Bool?
    let isSuperuser: Bool?
    let fullName: String?
    let id: Int?
    let lastActivity: Int?
    let avatar: String?
    let firstName: String?
    let lastName: String?
    let patronymic: String?
    let birthdate: Int?
    let gender: Int?
    let fields: [GettingField]?
}
