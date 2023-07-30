//
//  CreditModel.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit
import PromiseKit

final class CreditModel {
    
    //MARK:  getAllUniversity
    func getAllOffers() -> Promise<DApi<[GettingOffer]>>  {
        let urlString = NetworkManager.baseURLString + "/api/offers/"
        let url = URL(string: urlString)!
        return CoreNetwork.request(method: .GET(url: url))
    }
}

struct GettingOffer:Codable {
    let title: String?
    let minPrice: Int?
    let maxPrice: Int?
    let percent: Int?
    let annualPayment: Int?
    let paymentTerm: Int?
    let id: Int?
    let bank: GettingBank?
}

struct GettingBank: Codable {
    let name: String?
    let url: String?
    let id: Int?
    let icon: String?
}
