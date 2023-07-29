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
    func getAllUniversity() -> Promise<DApi<[GettingUniversity]>>  {
        let urlString = NetworkManager.baseURLString + "/api/cp/universities/"
        let url = URL(string: urlString)!
        return CoreNetwork.request(method: .GET(url: url))
    }
    
    //MARK:  getAllUniversity
    func getAllFaculty() -> Promise<DApi<[GettingFaculty]>>  {
        let urlString = NetworkManager.baseURLString + "/api/faculties/"
        let url = URL(string: urlString)!
        return CoreNetwork.request(method: .GET(url: url))
    }
    
    
    //MARK: getFacultyWith
    func getFacultyWith(facultyId: Int) ->Promise<DApi<GettingFaculty>> {
        let urlString = NetworkManager.baseURLString + "/api/faculties/\(facultyId)/"
        let url = URL(string: urlString)!
        return CoreNetwork.request(method: .GET(url: url))
    }

}


struct GettingUniversity: Codable {
    let name: String?
    let lat: String?
    let lon: String?
    let url: String?
    let id: Int?
    let photo: String?
    let city: GettingCity?
}

struct GettingCity: Codable {
    let name: String?
    let id: Int?
}


struct DApi <T: Codable>: Codable {
    let message: String?
    let description: String?
    let data: T?
}

struct GettingFaculty: Codable {
    let name: String?
    let id: Int?
    let university: GettingUniversity?
    let description: String?
    let avgMark: Float?
    let fields: [GettingField]?
    let minPrice: Int?
}

struct GettingField: Codable {
    let name: String?
    let url: String?
    let description: String?
    let minMark: Int?
    let price: Int?
    let id: Int?
}


struct City: Codable {
    let name: String
    let id: Int
}
