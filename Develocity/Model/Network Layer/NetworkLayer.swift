//
//  NetworkLayer.swift
//  Develocity
//
//  Created by Ahmed Soultan on 22/06/2022.
//

import Foundation
import Alamofire

let baseURL = "https://api.develocity.finance/api/v1/"

enum EndPoint {
    case tokenInfoEndPoint(String)
    case getBSCContractDetail(String)
    case humanSummery(String)
    case BSCholderScan(String)
    case buySellBSCFeePercentage(String)
    
    var url: URL {
        return URL(string: self.stringValue) ?? URL(string: "")!
    }
    
    var stringValue: String {
        switch self {
        case .tokenInfoEndPoint(let contract_Address):
            return baseURL+"contract/tokenInfo?contractAddress=\(contract_Address)"+"&contractType=Binance"
//        case .tokenInfoEndPoint(let contract_Address , let contract_Type):
//            return baseURL+"contract/tokenInfo?contractAddress=\(contract_Address)"+"&contractType=\(contract_Type)"
            
        case .getBSCContractDetail(let contract_Address):
            return baseURL+"contract/getBSCContractDetail/\(contract_Address)"
            
        case .humanSummery(let contract_Address):
            return baseURL+"contract/humanSummary/\(contract_Address)"
            
        case .BSCholderScan(let contract_Address):
            return baseURL+"contract/BSCholderScan?contractAddress=\(contract_Address)"
            
        case .buySellBSCFeePercentage(let contract_Address):
            return baseURL+"contract/buySellBSCFeePercentage?contractAddress=\(contract_Address)"
            
        }
    }
}

class NetworkLayer: TokenInfoProtocol {
    
    private init() {}
    
    static let shared = NetworkLayer()
    
//    func requestTokenInfo( contractAddress : String , completionHandler: @escaping (Token , Error?) -> Void){
//        let _ = URLSession.shared.dataTask(with: EndPoint.tokenInfoEndPoint(contractAddress).url) { data, response, error in
//            guard let data = data else {
//                completionHandler(Token(responseCode: 500, responseMessage: "Connection Failed",result: nil), error)
//                return
//            }
//            let decoder = JSONDecoder()
//            do{
//                let json = try decoder.decode(Token.self, from: data)
//                completionHandler(json, nil)
//            }catch{
//                print(error.localizedDescription)
//            }
//        }.resume()
//    }
    
    func fetchData<T: Decodable>(endPoint: EndPoint , calssName: T.Type ,compeletionHandaler: @escaping (T? , Error?) -> ())
      {
          let endPointURL = endPoint.url

          AF.request(endPointURL).validate().responseDecodable(of: T.self) { response in
              switch response.result
              {
              case .success:
                  guard let token = response.value else {return}
                  print(token)
                  compeletionHandaler(token , nil)

              case .failure(let error):
                  print(error)
                  compeletionHandaler(nil , error)
              }
          }
      }
}

