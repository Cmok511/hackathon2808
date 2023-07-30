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
    func getAllFaculty(with city: Int? = nil, costFrom: Int? = nil, costTo: Int? = nil) -> Promise<DApi<[GettingFaculty]>>  {
        let urlString = NetworkManager.baseURLString + "/api/faculties/"
        var components = URLComponents(string: urlString)
        var queryItems: [URLQueryItem] = []
        if let city {
            queryItems.append(URLQueryItem(name: "city_id", value: "\(city)"))
        }
        if let costFrom {
            queryItems.append(URLQueryItem(name: "cost_from", value: "\(costFrom)"))
        }
        
        if let costTo {
            queryItems.append(URLQueryItem(name: "cost_to", value: "\(costTo)"))
        }
        components?.queryItems = queryItems
        let url = components?.url!
        return CoreNetwork.request(method: .GET(url: url!))
    }
    
    //MARK: getFacultyWith
    func getFacultyWith(facultyId: Int) ->Promise<DApi<GettingFaculty>> {
        let urlString = NetworkManager.baseURLString + "/api/faculties/\(facultyId)/"
        let url = URL(string: urlString)!
        return CoreNetwork.request(method: .GET(url: url))
    }
    
    //MARK: addTarget
    func addTarget(id: Int) -> Promise<DApi<GettingField>> {
        let urlString = NetworkManager.baseURLString + "/api/fields/\(id)/"
        let url = URL(string: urlString)!
        return CoreNetwork.request(method: .POST(url: url, body: nil))
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
    let isSelected: Bool?
}


struct City: Codable {
    let name: String
    let id: Int
}

