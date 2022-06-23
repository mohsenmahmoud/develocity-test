//
//  tokenInformationVC.swift
//  Develocity
//
//  Created by mohsen on 19/06/2022.
//

import UIKit

class tokenInformationVC: UIViewController {
    
    
    @IBOutlet weak var titleToken: UILabel!
    @IBOutlet weak var titleSymbol: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var priceMarketCap: UILabel!
    @IBOutlet weak var priceTotalSupply: UILabel!
    @IBOutlet weak var launched: UILabel!
    @IBOutlet weak var added: UILabel!
    @IBOutlet weak var detailsToken: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getDataInfo()
        fetchTokenData(apiService: NetworkLayer.shared, contractAddress: "0x0a3A21356793B49154Fd3BbE91CBc2A16c0457f5")
        
        print("dddddddddddddddddddd")

    }
    
    func fetchTokenData (apiService: NetworkLayer , contractAddress: String) {
        
        apiService.fetchData(endPoint: EndPoint.tokenInfoEndPoint(contractAddress), calssName: Token.self) { tokenResult, error in
            
            guard let data = tokenResult else{ return }
            //print(token.result?.contractInfo?.name!)
            self.titleToken.text = data.result?.contractInfo?.name
            self.titleSymbol.text = data.result?.contractInfo?.symbol
             let y = Double(round(10000 * (data.result?.contractInfo?.current_price ?? 0)) / 10000)
            self.price.text = String(y)
            
            
            self.priceMarketCap.text =  String("\(data.result?.contractInfo?.market_cap ?? 0)")
  
            self.priceTotalSupply.text = data.result?.contractInfo?.total_supply
            self.launched.text = data.result?.updatedAt
            self.added.text = data.result?.createdAt
            self.detailsToken.text = data.result?.contractInfo?.description
//            self.result = token
            
            guard let errorMessage = error?.localizedDescription else{ return }
//            self.errorMessage = errorMessage
        }
        
    }
    
    
//    func getDataInfo(){
//        // Do any additional setup after loading the view.
//        NetworkLayer.shared.fetchData(endPoint:EndPoint.tokenInfoEndPoint("0x4D61577d8Fd2208A0afb814ea089fDeAe19ed202"), calssName: Token.self) {  result in
//            switch result{
//            case .success(let data):
//                print(data)
//                self.titleToken.text = data?.result?.contractInfo?.name
//                self.titleSymbol.text = data?.result?.contractInfo?.symbol
//                self.price.text = String("\(data?.result?.contractInfo?.current_price ?? 0)")
//                self.priceMarketCap.text =  String("\(data?.result?.contractInfo?.market_cap ?? 0)")
//
//                self.priceTotalSupply.text = data?.result?.contractInfo?.total_supply
//                self.launched.text = data?.result?.updatedAt
//                self.added.text = data?.result?.createdAt
//                self.detailsToken.text = data?.result?.contractInfo?.description
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }

}
