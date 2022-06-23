//
//  ReportHomeViewController.swift
//  Develocity
//
//  Created by Ahmed Soultan on 19/06/2022.
//

import UIKit

class ReportHomeViewController: UIViewController {

    @IBOutlet weak var coinImage: UIImageView!
    
    @IBOutlet weak var coinLetterLabel: UILabel!
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var coinShortName: UILabel!
    
    @IBOutlet weak var coinTotalScore: UILabel!
    @IBOutlet weak var shareBtn: UIButton!
    
    @IBOutlet weak var screenSegmentedControl: UISegmentedControl!
    @IBOutlet weak var screenTitle: UILabel!
    
    @IBOutlet weak var trustScoreContainerView: UIView!
    @IBOutlet weak var detailsContainerView: UIView!
    @IBOutlet weak var tokenInfoContainerView: UIView!
    
    let trustScoreContainer = FinalScoreVC()
    let detailsContainer = detailsReoprtVC()
    let tokenContainer = tokenInformationVC()
    
    var searchContractAddress = ""
    let reportViewModel = ReportViewModel()
    var currentToken = Token(responseCode: 500, responseMessage: "Empty", result: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupScreen()
        setupContainerView()
        
        //Test Address: "0x0a3A21356793B49154Fd3BbE91CBc2A16c0457f5" Passed
        //Test Address: "0x5E5115ce00d9f1de34454Ea6211c1412cF238ce1" Failed
        
        reportViewModel.contractAddress = searchContractAddress
        
        reportViewModel.bindTokenData = {
            self.onSuccessUpdateView()
        }
        
        reportViewModel.bindErrorMessage = {
            self.onFailUpdateView()
        }
        
        coinLetterLabel.layer.cornerRadius = coinLetterLabel.layer.frame.height / 2
        coinLetterLabel.layer.masksToBounds = true
        
    }
    
    func onSuccessUpdateView() {
//        print(reportViewModel.result)
        DispatchQueue.main.async{
            self.currentToken = self.reportViewModel.result
            
            self.coinName.text = self.currentToken.result?.contractInfo?.name!
            self.coinShortName.text = self.currentToken.result?.contractInfo?.symbol!
            let coinName = (self.currentToken.result?.contractInfo?.name!)!
            self.coinLetterLabel.text = coinName.first?.description
            
            let totalScoreDoubleValue = (self.currentToken.result?.contractScan!)!
            let totalScoreValue = Int(totalScoreDoubleValue)
            let totalScore = totalScoreValue.description
            self.coinTotalScore.text = totalScore
            self.trustScoreContainer.progressPercentageLabel.text = totalScore
            self.trustScoreContainer.criticalProblemsNumberLabel.text = self.currentToken.result?.numberOfHighIssue!
            let numberOfLowIssues = Double(self.currentToken.result?.numberOfLowIssue! ?? "0")!
            let numberOfMediumIssues = Double(self.currentToken.result?.numberOfMediunIssue! ?? "0")!
            let numberOfImportantIssues = Int(numberOfLowIssues + numberOfMediumIssues)
            self.trustScoreContainer.importantProblemsNumberLabel.text = numberOfImportantIssues.description
            self.trustScoreContainer.informationalProblemsNumberLabel.text = self.currentToken.result?.numberOfInformationalIssue!
            
            self.trustScoreContainer.totalScoreValue = NSNumber(value: totalScoreDoubleValue/100)
            
            
            let newTableData = FinalScoreVC.TableRowData()
            let honeyPot = self.currentToken.result?.honeypotTest ?? ""
            
            if  honeyPot.elementsEqual("PASS"){
                newTableData.title = "Honeypot Test: Passed"
                newTableData.description = "Trading Simulation shows that trading is open, which means token is not a honeypot."
                newTableData.boolVal = true
            } else {
                newTableData.title = "Honeypot Test: Failed"
                newTableData.description = "Trading Simulation shows that sell is closed, which means token is honeypot."
                newTableData.boolVal = false
            }
            
            self.trustScoreContainer.tableDataArray.append(newTableData)
            
            //self.detailsContainer.currentToken = self.currentToken
        }
    }
    
    func onFailUpdateView() {
//        print(reportViewModel.errorMessage)
        
    }
    
    
    
    private func setupContainerView(){
        addChild(trustScoreContainer)
        trustScoreContainerView.addSubview(trustScoreContainer.view)
        trustScoreContainer.didMove(toParent: self)
        
        addChild(detailsContainer)
        detailsContainerView.addSubview(detailsContainer.view)
        detailsContainer.didMove(toParent: self)
        
        addChild(tokenContainer)
        tokenInfoContainerView.addSubview(tokenContainer.view)
        tokenContainer.didMove(toParent: self)
        
        
        constrainForHolderView()
    }
    
    func constrainForHolderView()
    {
        trustScoreContainer.view.translatesAutoresizingMaskIntoConstraints = false
        trustScoreContainer.view.bottomAnchor.constraint(equalTo: trustScoreContainerView.bottomAnchor).isActive = true
        trustScoreContainer.view.topAnchor.constraint(equalTo: trustScoreContainerView.topAnchor).isActive = true
        trustScoreContainer.view.leadingAnchor.constraint(equalTo: trustScoreContainerView.leadingAnchor).isActive = true
        trustScoreContainer.view.trailingAnchor.constraint(equalTo: trustScoreContainerView.trailingAnchor).isActive = true
        
        detailsContainer.view.translatesAutoresizingMaskIntoConstraints = false
        detailsContainer.view.bottomAnchor.constraint(equalTo: detailsContainerView.bottomAnchor).isActive = true
        detailsContainer.view.topAnchor.constraint(equalTo: detailsContainerView.topAnchor).isActive = true
        detailsContainer.view.leadingAnchor.constraint(equalTo: detailsContainerView.leadingAnchor).isActive = true
        detailsContainer.view.trailingAnchor.constraint(equalTo: detailsContainerView.trailingAnchor).isActive = true
        
        tokenContainer.view.translatesAutoresizingMaskIntoConstraints = false
        tokenContainer.view.bottomAnchor.constraint(equalTo: tokenInfoContainerView.bottomAnchor).isActive = true
        tokenContainer.view.topAnchor.constraint(equalTo: tokenInfoContainerView.topAnchor).isActive = true
        tokenContainer.view.leadingAnchor.constraint(equalTo: tokenInfoContainerView.leadingAnchor).isActive = true
        tokenContainer.view.trailingAnchor.constraint(equalTo: tokenInfoContainerView.trailingAnchor).isActive = true
        
    }
    
    private func setupScreen(){
        trustScoreContainerView.alpha = 1
        detailsContainerView.alpha = 0
        tokenInfoContainerView.alpha = 0
        screenTitle.text = "Final Score"
        
        coinTotalScore.layer.borderColor = coinTotalScore.textColor.cgColor
        coinTotalScore.layer.borderWidth = 0.5
        coinTotalScore.layer.cornerRadius = 4
        shareBtn.layer.borderColor = UIColor.lightGray.cgColor
        shareBtn.layer.borderWidth = 0.5
        shareBtn.layer.cornerRadius = 4
    }
    
    @IBAction func shareBtnAction(_ sender: Any) {
    }
    
    @IBAction func screensSegmentedControl(_ sender: Any) {
        switch screenSegmentedControl.selectedSegmentIndex {
        case 0:
            trustScoreContainerView.alpha = 1
            detailsContainerView.alpha = 0
            tokenInfoContainerView.alpha = 0
            screenTitle.text = "Final Score"
        case 1:
            trustScoreContainerView.alpha = 0
            detailsContainerView.alpha = 1
            tokenInfoContainerView.alpha = 0
            screenTitle.text = "Contract Analysis"
        case 2:
            trustScoreContainerView.alpha = 0
            detailsContainerView.alpha = 0
            tokenInfoContainerView.alpha = 1
            screenTitle.text = "General Information"
        default:
            trustScoreContainerView.alpha = 1
            detailsContainerView.alpha = 0
            tokenInfoContainerView.alpha = 0
            screenTitle.text = "Final Score"
        }
    }
}
