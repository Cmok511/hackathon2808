//
//  HelpModel.swift
//  hackathon2808
//
//  Created by Денис Чупров on 30.07.2023.
//

import Foundation
import PromiseKit
import UIKit

final class HelpModel {
    
    //MARK:  getAllUniversity
    func getFinSupport() -> Promise<DApi<[GettingSupport]>>  {
        let urlString = NetworkManager.baseURLString + "/api/supports/"
        var component = URLComponents(string: urlString)
        let query = [
            URLQueryItem(name: "is_test", value: "\(false)"),
            URLQueryItem(name: "support_type", value: "financial"),
        
        ]
        component?.queryItems = query
        let url = component?.url!
        return CoreNetwork.request(method: .GET(url: url!))
    }
    
    
    //MARK:  getAllUniversity
    func getUniver() -> Promise<DApi<[GettingSupport]>>  {
        let urlString = NetworkManager.baseURLString + "/api/supports/"
        var component = URLComponents(string: urlString)
        let query = [
            URLQueryItem(name: "is_test", value: "\(false)"),
            URLQueryItem(name: "support_type", value: "university"),
            
        ]
        component?.queryItems = query
        let url = component?.url!
        return CoreNetwork.request(method: .GET(url: url!))
    }
    
    
    //MARK:  getAllUniversity
    func getTests() -> Promise<DApi<[GettingSupport]>>  {
        let urlString = NetworkManager.baseURLString + "/api/supports/"
        var component = URLComponents(string: urlString)
        let query = [
            URLQueryItem(name: "is_test", value: "\(true)"),
            URLQueryItem(name: "support_type", value: "university"),
            
        ]
        component?.queryItems = query
        let url = component?.url!
        return CoreNetwork.request(method: .GET(url: url!))
    }
    
    
    
    
    
    let fin = HelpHelper(title: "Финансовая грамотность", description: "Получите навыки и установки в сфере финансового поведения, которые помогут вам успешно накапливать средства на образование, принимать осмысленные решения о кредитах на обучение, эффективно управлять своими финансами и обеспечить своё будущее с качественным образованием.",
                         image: UIImage(named: "finImage"))
    
    let prepere = HelpHelper(title: "Подготовка к поступлению",
                             description: "Готовьтесь к поступлению! Список обучающей документации согласно выбранным направлениям.", image: UIImage(named: "prepereImage"))
    
    let test = HelpHelper(title: "Тесты от Вузов",
                          description: "Исследуйте свои возможности! Тесты по вузам и направлениям, которые вы выбрали.",
                          image: UIImage(named: "BookImage"))
}

struct GettingSupport: Codable {
    let isTest: Bool?
    let url: String?
    let title: String?
    let lessonCount: Int?
    let taskCount: Int?
    let description: String?
    let content: String?
    let id: Int
    let university: GettingUniversity?
    let bank: GettingBank?
}

struct HelpHelper {
    let title: String?
    let description: String?
    let image: UIImage?
}
