 //
//  Protocols.swift
//  Develocity
//
//  Created by Ahmed Soultan on 22/06/2022.
//

import Foundation

protocol TokenInfoProtocol {
//    func requestTokenInfo(contractAddress: String ,completionHandler: @escaping (TokenInfo, Error?) -> Void)
//    func fetchData<T: Decodable>(endPoint: EndPoint , calssName: T.Type ,compeletionHandaler: @escaping (Result<T? , Error>) -> ())
    func fetchData<T: Decodable>(endPoint: EndPoint , calssName: T.Type ,compeletionHandaler: @escaping (T? , Error?) -> ())
}
