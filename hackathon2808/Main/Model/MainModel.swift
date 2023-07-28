//
//  MainModel.swift
//  hackathon2808
//
//  Created by Денис Чупров on 28.07.2023.
//

import Foundation
import UIKit
import PromiseKit



final class MainModel {
    
    //MARK:  getAllUniversity
    func getAllUniversity() -> Promise<DApi<GettingUniversity>>  {
        let urlString = NetworkManager.baseURLString + ""
        let url = URL(string: urlString)!
        return CoreNetwork.request(method: .GET(url: url))
    }
}


struct DApi <T: Codable>: Codable {
    let message: String?
    let description: String?
    let data: T?
}

struct GettingUniversity: Codable {
    
}
