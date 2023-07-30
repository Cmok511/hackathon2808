//
//  AppealsModel.swift
//  hackathon2808
//
//  Created by Денис Чупров on 29.07.2023.
//

import Foundation
import UIKit
import PromiseKit

final class AppealsModel {
    
    //MARK: getFacultyWith
    func getAllAppeals() ->Promise<DApi<[GettingBid]>> {
        let urlString = NetworkManager.baseURLString + "/api/offers/bids/"
        let url = URL(string: urlString)!
        return CoreNetwork.request(method: .GET(url: url))
    }
}

struct GettingBid: Codable {
    let desiredAmount: Int?
    let id: Int?
    let isAccepted: Bool?
    let actualAmount: Int?
    let annualPayment: Int?
    let percent: Int?
    let created: Int?
    let offer: GettingOffer?
}
