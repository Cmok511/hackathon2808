//
//  ProfileModel.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit
import PromiseKit

final class ProfileModel {
    
    //MARK: enterInApp
    func updateUser(user: UpdatingUser) -> Promise<DApi<TokenWithUser>> {
        let utlString = NetworkManager.baseURLString + "/api/users/me/"
        let url = URL(string: utlString)!
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let data = try! encoder.encode(user)
        return CoreNetwork.request(method: .PUT(url: url, body: data))
    }
    
    
    //MARK: Change Avatar
    func changeImage(image: Data) -> Promise<DApi<GettingUser>> {
        let urlString = NetworkManager.baseURLString + "/api/users/me/photo/"
        let url = URL(string: urlString)!
       
        let media = NetCoreMedia(
            with: image,
            forKey: "new_photo",
            mediaType: .image
        )
        let configuration = MultipartRequestConfiguration(url: url, media: [media], parameters: [:])
        return CoreNetwork.request(method: .MultipartPOST(configuration: configuration))
    }
    //MARK: - getMyProfile
    
    func getMyProfile() -> Promise<DApi<GettingUser>> {
        let utlString = NetworkManager.baseURLString + "/api/users/me/"
        let url = URL(string: utlString)!
        return CoreNetwork.request(method: .GET(url: url))
    }
    
}

struct AchivmentsHelper {
    let image: UIImage?
    let title: String?
}

struct UpdatingUser: Codable {
    let firstName: String?
    let lastName: String?
    let patronymic: String?
    let birthdate: Int?
    let gender: Int?
}
