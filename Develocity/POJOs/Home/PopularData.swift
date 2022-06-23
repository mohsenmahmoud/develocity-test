//
//  PopularData.swift
//  Develocity
//
//  Created by Hassan on 22/06/2022.
//

import Foundation
struct PopularData : Codable {
    let contractInfo : ContractInfo2?
    let contractScan : Double?
    let isNotListed : Bool?
    let interest: Int?
    let createdAt : String?
    

}


struct ContractInfo2 : Codable {
    let name : String?
    let symbol : String?
}


class SocketParser {

    static func convert<T: Decodable>(data: Any) throws -> T {
        let jsonData = try JSONSerialization.data(withJSONObject: data)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: jsonData)
    }

    static func convert<T: Decodable>(datas: [Any]) throws -> [T] {
        return try datas.map { (dict) -> T in
            let jsonData = try JSONSerialization.data(withJSONObject: dict)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: jsonData)
        }
    }

}
