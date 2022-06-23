//
//  Token.swift
//  Develocity
//
//  Created by Ahmed Soultan on 22/06/2022.
//

import Foundation
struct Token : Codable {
    let responseCode : Int?
    let responseMessage : String?
    let result : TokenResult?

    enum CodingKeys: String, CodingKey {

        case responseCode = "responseCode"
        case responseMessage = "responseMessage"
        case result = "result"
    }
}

struct TokenResult : Codable {
    let contractInfo : ContractInfo?
    let ownerInfo : OwnerInfo?
    let scanStatus : ScanStatus?
    let exitsfunction : [String]?
    let isAuditVerified : Bool?
    let addLiquidityTransaction : [String]?
    let burnLiquidityTransaction : [String]?
    let removeLiquidityTransaction : [String]?
    let getTokenInfo : [String]?
    let tokenRequest : Bool?
    let interest : Int?
    let shareCount : Int?
    let ips : [String]?
    let status : String?
    let _id : String?
    let numberOfOptimizationIssue : String?
    let numberOfInformationalIssue : String?
    let numberOfLowIssue : String?
    let numberOfMediunIssue : String?
    let numberOfHighIssue : String?
    let humanDetails : String?
    let contractScan : Double?
    let contractType : String?
    let contractAddress : String?
    let topTenHolder : [TopTenHolder]?
    let createdAt : String?
    let updatedAt : String?
    let __v : Int?
    let isNotListed : Bool?
    let antiBot : Bool?
    let antiWhale : Bool?
    let burn : Bool?
    let disabletrading : Bool?
    let honeypotTest : String?
    let mint : Bool?
    let reflection : Bool?
    let selfdistruction : Bool?
    let totalSupply : String?
    let transferOwnership : Bool?
    let airdropHolders : Int?
    let airdropHoldersPercentage : String?
    let realholders : Int?
    let realholdersPercentage : String?
    let shrinkHolders : Int?
    let shrinkHoldersPercentage : String?
    let totalHolder : Int?

    enum CodingKeys: String, CodingKey {

        case contractInfo = "contractInfo"
        case ownerInfo = "ownerInfo"
        case scanStatus = "scanStatus"
        case exitsfunction = "exitsfunction"
        case isAuditVerified = "isAuditVerified"
        case addLiquidityTransaction = "addLiquidityTransaction"
        case burnLiquidityTransaction = "burnLiquidityTransaction"
        case removeLiquidityTransaction = "removeLiquidityTransaction"
        case getTokenInfo = "getTokenInfo"
        case tokenRequest = "tokenRequest"
        case interest = "interest"
        case shareCount = "shareCount"
        case ips = "ips"
        case status = "status"
        case _id = "_id"
        case numberOfOptimizationIssue = "numberOfOptimizationIssue"
        case numberOfInformationalIssue = "numberOfInformationalIssue"
        case numberOfLowIssue = "numberOfLowIssue"
        case numberOfMediunIssue = "numberOfMediunIssue"
        case numberOfHighIssue = "numberOfHighIssue"
        case humanDetails = "humanDetails"
        case contractScan = "contractScan"
        case contractType = "contractType"
        case contractAddress = "contractAddress"
        case topTenHolder = "topTenHolder"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case __v = "__v"
        case isNotListed = "isNotListed"
        case antiBot = "antiBot"
        case antiWhale = "antiWhale"
        case burn = "burn"
        case disabletrading = "disabletrading"
        case honeypotTest = "honeypotTest"
        case mint = "mint"
        case reflection = "reflection"
        case selfdistruction = "selfdistruction"
        case totalSupply = "totalSupply"
        case transferOwnership = "transferOwnership"
        case airdropHolders = "airdropHolders"
        case airdropHoldersPercentage = "airdropHoldersPercentage"
        case realholders = "realholders"
        case realholdersPercentage = "realholdersPercentage"
        case shrinkHolders = "shrinkHolders"
        case shrinkHoldersPercentage = "shrinkHoldersPercentage"
        case totalHolder = "totalHolder"
    }
}

struct ContractInfo : Codable {
    let name : String?
    let symbol : String?
    let current_price : Double?
    let market_cap : Int?
    let age : String?
    let divisor : String?
    let total_supply : String?
    let description : String?
    let tokenPriceUSD : String?
    let website : String?
    let email : String?
    let blog : String?
    let reddit : String?
    let facebook : String?
    let twitter : String?
    let bitcointalk : String?
    let github : String?
    let telegram : String?
    let wechat : String?
    let linkedin : String?
    let discord : String?
    let whitepaper : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case symbol = "symbol"
        case current_price = "current_price"
        case market_cap = "market_cap"
        case age = "age"
        case divisor = "divisor"
        case total_supply = "total_supply"
        case description = "description"
        case tokenPriceUSD = "tokenPriceUSD"
        case website = "website"
        case email = "email"
        case blog = "blog"
        case reddit = "reddit"
        case facebook = "facebook"
        case twitter = "twitter"
        case bitcointalk = "bitcointalk"
        case github = "github"
        case telegram = "telegram"
        case wechat = "wechat"
        case linkedin = "linkedin"
        case discord = "discord"
        case whitepaper = "whitepaper"
    }
}

struct OwnerInfo : Codable {
    let lockedToken : [LockedToken]?
    let top10LiquidityHolder : [Top10LiquidityHolder]?
    let tokenTransaction : [String]?
    let transactions : [String]?
    let pairAddress : String?
    let ownerAddress : String?
    let lockedLiquidity : String?
    let lockedTokenBalance : String?
    let getLiquidityBalance : String?
    let tokenBalance : String?
    let tokenBalance_percentage : String?
    let renounceOwnership : Bool?
    let lockedLiquidityToken : String?
    let lockedLiquidityTokenPercentage : String?
    let lockedLiquidityTokens : [LockedLiquidityTokens]?

    enum CodingKeys: String, CodingKey {

        case lockedToken = "lockedToken"
        case top10LiquidityHolder = "top10LiquidityHolder"
        case tokenTransaction = "tokenTransaction"
        case transactions = "transactions"
        case pairAddress = "pairAddress"
        case ownerAddress = "ownerAddress"
        case lockedLiquidity = "lockedLiquidity"
        case lockedTokenBalance = "lockedTokenBalance"
        case getLiquidityBalance = "getLiquidityBalance"
        case tokenBalance = "tokenBalance"
        case tokenBalance_percentage = "tokenBalance_percentage"
        case renounceOwnership = "renounceOwnership"
        case lockedLiquidityToken = "lockedLiquidityToken"
        case lockedLiquidityTokenPercentage = "lockedLiquidityTokenPercentage"
        case lockedLiquidityTokens = "lockedLiquidityTokens"

//        case ownerAddress = "ownerAddress"
//        case pairAddress = "pairAddress"
//        case lockedLiquidity = "lockedLiquidity"
//        case lockedTokenBalance = "lockedTokenBalance"
//        
//        case getLiquidityBalance = "getLiquidityBalance"
//        
//        case tokenBalance = "tokenBalance"
//        case tokenBalancePercentage = "tokenBalance_percentage"
//        case renounceOwnership = "renounceOwnership"
//        
//        case lockedLiquidityToken = "lockedLiquidityToken"
//        case lockedLiquidityTokenPercentage = "lockedLiquidityTokenPercentage"
        
    }
}

struct ScanStatus : Codable {
    let isContractSummary : Bool?
    let isHumanSummary : Bool?
    let isAuditReport : Bool?
    let isPolygonContractDetail : Bool?
    let isBSCContractDetail : Bool?
    let isETHContractDetail : Bool?
    let isBSCgetEstimateGasPrice : Bool?
    let isBscLiquidityScan : Bool?
    let isETHLiquidityScan : Bool?
    let isPoygonLiquidityScan : Bool?
    let isBSCholderScan : Bool?
    let isETHholderScan : Bool?
    let isPolygonHolderScan : Bool?
    let isETHScanDetails : Bool?
    let isBuySellBSCFeePercentage : Bool?
    let isBuySellFeeETHPercentage : Bool?
    let isBSCOwnerDetails : Bool?
    let isETHOwnerDetails : Bool?
    let isPolygonOwnerDetails : Bool?
    let isTokenInfo : Bool?
    let isBSCInfo : Bool?
    let isETHInfo : Bool?
    let isPolygonInfo : Bool?

    enum CodingKeys: String, CodingKey {

        case isContractSummary = "isContractSummary"
        case isHumanSummary = "isHumanSummary"
        case isAuditReport = "isAuditReport"
        case isPolygonContractDetail = "isPolygonContractDetail"
        case isBSCContractDetail = "isBSCContractDetail"
        case isETHContractDetail = "isETHContractDetail"
        case isBSCgetEstimateGasPrice = "isBSCgetEstimateGasPrice"
        case isBscLiquidityScan = "isBscLiquidityScan"
        case isETHLiquidityScan = "isETHLiquidityScan"
        case isPoygonLiquidityScan = "isPoygonLiquidityScan"
        case isBSCholderScan = "isBSCholderScan"
        case isETHholderScan = "isETHholderScan"
        case isPolygonHolderScan = "isPolygonHolderScan"
        case isETHScanDetails = "isETHScanDetails"
        case isBuySellBSCFeePercentage = "isBuySellBSCFeePercentage"
        case isBuySellFeeETHPercentage = "isBuySellFeeETHPercentage"
        case isBSCOwnerDetails = "isBSCOwnerDetails"
        case isETHOwnerDetails = "isETHOwnerDetails"
        case isPolygonOwnerDetails = "isPolygonOwnerDetails"
        case isTokenInfo = "isTokenInfo"
        case isBSCInfo = "isBSCInfo"
        case isETHInfo = "isETHInfo"
        case isPolygonInfo = "isPolygonInfo"
    }
}

struct TopTenHolder : Codable {
    let _id : String?
    let tokenHolderAddress : String?
    let tokenHolderQuantity : String?
    let percentage : String?

    enum CodingKeys: String, CodingKey {

        case _id = "_id"
        case tokenHolderAddress = "TokenHolderAddress"
        case tokenHolderQuantity = "TokenHolderQuantity"
        case percentage = "percentage"
    }
}

struct Top10LiquidityHolder : Codable {
    let tokenHolderAddress : String?
    let tokenHolderQuantity : String?
    let percentage : Double?

    enum CodingKeys: String, CodingKey {

        case tokenHolderAddress = "TokenHolderAddress"
        case tokenHolderQuantity = "TokenHolderQuantity"
        case percentage = "percentage"
    }
}

struct LockedToken : Codable {
    let lockedToken : Int?
    let lockedPercentage : Int?
    let lockerName : String?
    let lockerContractAddress : String?
    let image : String?

    enum CodingKeys: String, CodingKey {

        case lockedToken = "lockedToken"
        case lockedPercentage = "lockedPercentage"
        case lockerName = "lockerName"
        case lockerContractAddress = "lockerContractAddress"
        case image = "image"
    }
}

struct LockedLiquidityTokens : Codable {
    let _id : String?
    let tokenHolderAddress : String?
    let tokenHolderQuantity : String?
    let percentage : Double?

    enum CodingKeys: String, CodingKey {

        case _id = "_id"
        case tokenHolderAddress = "TokenHolderAddress"
        case tokenHolderQuantity = "TokenHolderQuantity"
        case percentage = "percentage"
    }
}
