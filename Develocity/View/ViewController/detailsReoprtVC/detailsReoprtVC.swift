//
//  detailsReoprtVC.swift
//  Develocity
//
//  Created by mohsen on 19/06/2022.
//

import UIKit
import Charts
class detailsReoprtVC: UIViewController , ChartViewDelegate {
    
    @IBOutlet weak var realholderLBL: UILabel!
    @IBOutlet weak var airdropHolderLBL: UILabel!
    @IBOutlet weak var walletShrinkLBL: UILabel!
    //
    
    @IBOutlet weak var mintLBL: UILabel!
    @IBOutlet weak var minBool: UILabel!
    
    @IBOutlet weak var burnLBL: UILabel!
    @IBOutlet weak var burnBool: UILabel!
    
    @IBOutlet weak var reflectLBL: UILabel!
    @IBOutlet weak var reflectBool: UILabel!
    
    @IBOutlet weak var destructionLBL: UILabel!
    @IBOutlet weak var destructionBool: UILabel!
    
    @IBOutlet weak var transferLBL: UILabel!
    @IBOutlet weak var transferBool: UILabel!
    
    @IBOutlet weak var antiwhaleLBL: UILabel!
    @IBOutlet weak var antiwhaleBool: UILabel!
    
    @IBOutlet weak var antibotLBL: UILabel!
    @IBOutlet weak var antibotBool: UILabel!
    
    
    
    @IBOutlet weak var OwnerAddres: UILabel!
    @IBOutlet weak var ownershipLBL: UILabel!
    @IBOutlet weak var liquidityLBL: UILabel!
    @IBOutlet weak var liquidityPrice: UILabel!
    
    @IBOutlet weak var tokensLBL: UILabel!
    @IBOutlet weak var tokensPrice: UILabel!
    @IBOutlet weak var tokensNumber: UILabel!
    
    @IBOutlet weak var buyLBL: UILabel!
    
    @IBOutlet weak var tranferLBL: UILabel!
    @IBOutlet weak var sellLBL: UILabel!
    
    var total : String?
    @IBOutlet weak var pieChartView: UIView!
    var pieChart  = PieChartView()
    @IBOutlet weak var topWalletsTableView: UITableView!
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        //getDataHolders()
        pieChart.delegate = self
        self.setupScreen()
        print("fffffffff")
        fetchReportData(apiService: NetworkLayer.shared, contractAddress: "0x4D61577d8Fd2208A0afb814ea089fDeAe19ed202")
        
        
        fetchgasFellData(apiService: NetworkLayer.shared, contractAddress: "0x4D61577d8Fd2208A0afb814ea089fDeAe19ed202")
    }
    
    func fetchReportData(apiService: NetworkLayer , contractAddress: String) {
        
        apiService.fetchData(endPoint: EndPoint.tokenInfoEndPoint(contractAddress), calssName: Token.self) { tokenResult, error in
            guard let data = tokenResult else{ return }
            //print(token.result?.contractInfo?.name!)
            
            //Top 10 Wallets
            
            //Holders Distribution
            self.realholderLBL.text = "\(String(describing: data.result?.realholders ?? 0))"
            self.airdropHolderLBL.text = "\(String(describing: data.result?.airdropHolders ?? 0))"
            self.walletShrinkLBL.text =  "\(String(describing: data.result?.shrinkHolders ?? 0))"
            
            //Token Owner
            self.OwnerAddres.text = data.result?.ownerInfo?.ownerAddress
            if (data.result?.ownerInfo?.renounceOwnership == true){
                self.ownershipLBL.text = "Not Rennounced"
                self.ownershipLBL.textColor = UIColor.red
            }else{
                print("")
            }
            
            self.liquidityPrice.text = data.result?.ownerInfo?.lockedTokenBalance
            self.liquidityLBL.text =  data.result?.ownerInfo?.lockedLiquidityTokenPercentage
            self.liquidityPrice.text = data.result?.ownerInfo?.getLiquidityBalance
            
            self.tokensLBL.text = data.result?.ownerInfo?.tokenBalance_percentage
            self.tokensPrice.text = data.result?.ownerInfo?.tokenBalance
            
            
            //Contract Analysis
            //mint
            if (data.result?.mint == true){
                self.minBool.textColor = UIColor(red: 0.925, green: 0.400, blue: 0.400, alpha: 1.0)
                self.minBool.backgroundColor = UIColor(red: 0.890, green: 0.251, blue: 0.329, alpha: 0.1)
                self.minBool.borderColor =  UIColor.red
                self.minBool.text = "Detected"
            }else{
                self.minBool.text = "Not Detected"
                self.minBool.textColor = UIColor(red: 0.337, green: 0.812, blue: 0.412, alpha: 1.0)
                self.minBool.borderColor = UIColor(red: 0.337, green: 0.812, blue: 0.412, alpha: 1.0)
                self.minBool.backgroundColor = UIColor(red: 0.298, green: 0.722, blue: 0.365, alpha: 0.1)
               
            }
            
            
            //burnBool
            if (data.result?.burn == true){
                self.burnBool.textColor = UIColor(red: 0.925, green: 0.400, blue: 0.400, alpha: 1.0)
                self.burnBool.backgroundColor = UIColor(red: 0.890, green: 0.251, blue: 0.329, alpha: 0.1)
                self.burnBool.borderColor =  UIColor.red
                self.burnBool.text = "Detected"
            }else{
                self.burnBool.text = "Not Detected"
                self.burnBool.textColor = UIColor(red: 0.337, green: 0.812, blue: 0.412, alpha: 1.0)
                self.burnBool.borderColor = UIColor(red: 0.337, green: 0.812, blue: 0.412, alpha: 1.0)
                self.burnBool.backgroundColor = UIColor(red: 0.298, green: 0.722, blue: 0.365, alpha: 0.1)
               
            }
            
            //reflection
            if (data.result?.reflection == true){
                self.reflectBool.textColor = UIColor(red: 0.925, green: 0.400, blue: 0.400, alpha: 1.0)
                self.reflectBool.backgroundColor = UIColor(red: 0.890, green: 0.251, blue: 0.329, alpha: 0.1)
                self.reflectBool.borderColor =  UIColor.red
                self.reflectBool.text = "Detected"
            }else{
                self.burnBool.text = "Not Detected"
                self.burnBool.textColor = UIColor(red: 0.337, green: 0.812, blue: 0.412, alpha: 1.0)
                self.burnBool.borderColor = UIColor(red: 0.337, green: 0.812, blue: 0.412, alpha: 1.0)
                self.burnBool.backgroundColor = UIColor(red: 0.298, green: 0.722, blue: 0.365, alpha: 0.1)
               
            }
            
            //selfdistruction
            if (data.result?.selfdistruction == true){
                self.destructionBool.textColor = UIColor(red: 0.925, green: 0.400, blue: 0.400, alpha: 1.0)
                self.destructionBool.backgroundColor = UIColor(red: 0.890, green: 0.251, blue: 0.329, alpha: 0.1)
                self.destructionBool.borderColor =  UIColor.red
                self.destructionBool.text = "Detected"
            }else{
                self.destructionBool.text = "Not Detected"
                self.destructionBool.textColor = UIColor(red: 0.337, green: 0.812, blue: 0.412, alpha: 1.0)
                self.destructionBool.borderColor = UIColor(red: 0.337, green: 0.812, blue: 0.412, alpha: 1.0)
                self.destructionBool.backgroundColor = UIColor(red: 0.298, green: 0.722, blue: 0.365, alpha: 0.1)
               
            }
            
            
            //transferOwnership
            if (data.result?.transferOwnership == true){
                self.transferBool.textColor = UIColor(red: 0.925, green: 0.400, blue: 0.400, alpha: 1.0)
                self.transferBool.backgroundColor = UIColor(red: 0.890, green: 0.251, blue: 0.329, alpha: 0.1)
                self.transferBool.borderColor =  UIColor.red
                self.transferBool.text = "Detected"
            }else{
                self.transferBool.text = "Not Detected"
                self.transferBool.textColor = UIColor(red: 0.337, green: 0.812, blue: 0.412, alpha: 1.0)
                self.transferBool.borderColor = UIColor(red: 0.337, green: 0.812, blue: 0.412, alpha: 1.0)
                self.transferBool.backgroundColor = UIColor(red: 0.298, green: 0.722, blue: 0.365, alpha: 0.1)
               
            }
            
            
            //antiwhaleBool
            if (data.result?.antiWhale == true){
                self.antiwhaleBool.textColor = UIColor(red: 0.925, green: 0.400, blue: 0.400, alpha: 1.0)
                self.antiwhaleBool.backgroundColor = UIColor(red: 0.890, green: 0.251, blue: 0.329, alpha: 0.1)
                self.antiwhaleBool.borderColor =  UIColor.red
                self.antiwhaleBool.text = "Detected"
            }else{
                self.antiwhaleBool.text = "Not Detected"
                self.antiwhaleBool.textColor = UIColor(red: 0.337, green: 0.812, blue: 0.412, alpha: 1.0)
                self.antiwhaleBool.borderColor = UIColor(red: 0.337, green: 0.812, blue: 0.412, alpha: 1.0)
                self.antiwhaleBool.backgroundColor = UIColor(red: 0.298, green: 0.722, blue: 0.365, alpha: 0.1)
               
            }
            
            
            //antiBot
            if (data.result?.antiBot == true){
                self.antibotBool.textColor = UIColor(red: 0.925, green: 0.400, blue: 0.400, alpha: 1.0)
                self.antibotBool.backgroundColor = UIColor(red: 0.890, green: 0.251, blue: 0.329, alpha: 0.1)
                self.antibotBool.borderColor =  UIColor.red
                self.antibotBool.text = "Detected"
            }else{
                self.antibotBool.text = "Not Detected"
                self.antibotBool.textColor = UIColor(red: 0.337, green: 0.812, blue: 0.412, alpha: 1.0)
                self.antibotBool.borderColor = UIColor(red: 0.337, green: 0.812, blue: 0.412, alpha: 1.0)
                self.antibotBool.backgroundColor = UIColor(red: 0.298, green: 0.722, blue: 0.365, alpha: 0.1)
               
            }
            
            guard let errorMessage = error?.localizedDescription else{ return }
//            self.errorMessage = errorMessage
        }
        
    }
    
    
    private func setupScreen(){
        topWalletsTableView.dataSource = self
        topWalletsTableView.delegate = self
        topWalletsTableView.register(ReportTableCell.nib(), forCellReuseIdentifier:ReportTableCell.cellIdentifier)
        topWalletsTableView.register(ReportTableHeaderCell.nib(), forCellReuseIdentifier:ReportTableHeaderCell.cellIdentifier)
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        
//        pieChart.frame = CGRect(x: 0, y: 0, width: pieChartView.frame.width + 40 , height: pieChartView.frame.height + 40)
//        
//        pieChart.center = pieChartView.center
//        view.addSubview(pieChart)
//        var entries = [ChartDataEntry]()
//        entries.append(ChartDataEntry(x: 0, y: 26))
//        entries.append(ChartDataEntry(x: 0, y: 54))
//        entries.append(ChartDataEntry(x: 0, y: 30))
//        let set = PieChartDataSet(entries: entries)
//        let color = [UIColor(rgb:  0xEC6666) , UIColor(rgb: 0x4CD696), UIColor(rgb:  0x7BE1D9)]
//        set.colors = color
//        //Hide Numbers in Chart
//        set.valueFont = UIFont.systemFont(ofSize: 0)
//        let data = PieChartData(dataSet: set)
//        pieChart.data = data
//        pieChart.holeRadiusPercent = 0.6
//        pieChart.transparentCircleRadiusPercent = 0.0
//        let totalNumText = "\(String(describing: total))"
//        let centerText = NSMutableAttributedString()
//        
//        let numberText = NSMutableAttributedString(string: " " + totalNumText, attributes: [NSAttributedString.Key.foregroundColor:UIColor(rgb: 0x31343A),NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)])
//        
//        let totalText = NSMutableAttributedString(string: "  Total\n", attributes: [NSAttributedString.Key.foregroundColor:UIColor(rgb: 0x888888),NSAttributedString.Key.font: UIFont.systemFont(ofSize: 8)])
//        
//        centerText.append(totalText)
//        centerText.append(numberText)
//
//        pieChart.centerAttributedText = centerText
//        pieChart.legend.textColor = UIColor.white
//        
//    }
}

extension detailsReoprtVC: UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  return currentToken.result?.topTenHolder?.count ?? 0
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reportCell = topWalletsTableView.dequeueReusableCell(withIdentifier: ReportTableCell.cellIdentifier, for: indexPath) as! ReportTableCell
        
       // let currentCell = currentToken.result?.topTenHolder?[indexPath.row]
//        reportCell.rankLabel.text = "\(indexPath.row)"
//        reportCell.addressLabel.text = currentCell?.tokenHolderAddress ?? ""
//        reportCell.balanceLabel.text = currentCell?.tokenHolderQuantity ?? ""
//        reportCell.precentgeLabel.text = currentCell?.percentage ?? ""
        
        reportCell.layer.masksToBounds = false
        reportCell.layer.cornerRadius = 4
        reportCell.layer.shadowRadius = 4
        reportCell.layer.shadowOpacity = 0.05
        reportCell.layer.shadowColor = UIColor.black.cgColor
        reportCell.layer.shadowOffset = CGSize(width: 1, height: 1 )
        
        
        return reportCell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let reportCellHeader = topWalletsTableView.dequeueReusableCell(withIdentifier: ReportTableHeaderCell.cellIdentifier) as! ReportTableHeaderCell
        
        return reportCellHeader
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 41
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 31
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        topWalletsTableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}




extension detailsReoprtVC {
    func fetchgasFellData (apiService: NetworkLayer , contractAddress: String) {
        
        apiService.fetchData(endPoint: EndPoint.buySellBSCFeePercentage(contractAddress), calssName: gasFeeModel.self) { gasFeeResult, error in
            
            guard let data = gasFeeResult else{ return }
            //print(token.result?.contractInfo?.name!)
            self.buyLBL.text = data.result?.buyGasFeeUSD
            self.sellLBL.text = data.result?.sellGasFeeUSD
            self.tranferLBL.text = data.result?.tranferGasFeeUSD
//            self.result = token
            
            guard let errorMessage = error?.localizedDescription else{ return }
//            self.errorMessage = errorMessage
        }
        
    }
}


 

