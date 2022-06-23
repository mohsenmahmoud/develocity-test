//
//  ReportViewModel.swift
//  Develocity
//
//  Created by Ahmed Soultan on 22/06/2022.
//

import Foundation

class ReportViewModel: NSObject {
    var networkService = NetworkLayer.shared
    var contractAddress = "0x0a3A21356793B49154Fd3BbE91CBc2A16c0457f5"{
        didSet{
            self.fetchTokenData(apiService: networkService, contractAddress: self.contractAddress)
        }
    }
    
    var result: Token = Token(responseCode: 500, responseMessage: "Empty", result: nil) {
        didSet{
            self.bindTokenData()
        }
    }
    
    var errorMessage: String = "" {
        didSet{
            self.bindErrorMessage()
        }
    }
    
    var bindTokenData: (()->()) = {}
    var bindErrorMessage: (()->()) = {}
    
    
    override init() {
        super.init()
//        self.fetchTokenData(apiService: networkService, contractAddress: self.contractAddress)
    }
    
    func fetchTokenData (apiService: NetworkLayer , contractAddress: String) {
        
        apiService.fetchData(endPoint: EndPoint.tokenInfoEndPoint(contractAddress), calssName: Token.self) { tokenResult, error in
            
            guard let token = tokenResult else{ return }
            self.result = token
            
            guard let errorMessage = error?.localizedDescription else{ return }
            self.errorMessage = errorMessage
        }
        
    }
    
}
