//
//  SocketLayer.swift
//  Develocity
//
//  Created by Hassan on 22/06/2022.
//

import Foundation
import SocketIO


enum Liseners : String
{
    case popular = "popularScan"
    case recently = "rcentlyAdded"
    case scan = "latestScan"
    case score = "highScore"
}

class SocketMng
{
    // MARK: - Properties
    let manager = SocketManager(socketURL: URL(string: "https://api.develocity.finance")!, config: [.log(false), .compress])
    var socket: SocketIOClient? = nil
    
  static let shared = SocketMng()
  
    private  init() {
        setupSocket()
        setupGeneralEvent(completionHandler: nil)
        socket?.connect()
    }
    
    
    // MARK: - Socket Setups
    func setupSocket() {
        self.socket = manager.defaultSocket
    }
    
    
    func stop() {
        socket?.removeAllHandlers()
    }
    
    
    
    func setupGeneralEvent(completionHandler:( (String?) -> ())?) {
        
        socket?.on(clientEvent: .connect) {data, ack in
            print("Socket Connected")
        }
    }
    
    func setupEvents(eventName: String , compltionHandeler:@escaping ( [PopularData]?) ->()){
        
        socket?.on(eventName) { (data, ack) in
            guard let dataInfo = data.first else { return }
            if let response: [PopularData] = try? SocketParser.convert(data: dataInfo) {
                
                compltionHandeler(response)
                
                for i in response
                {
                    print ("Symbol: \(i.contractInfo!.symbol!)" )
                    print ( "Name: \(i.contractInfo!.name!)")
                    print ("Score: \(i.contractScan)")
                    print ("Scans: \(i.interest!)")
                    print ("Verified: \(i.isNotListed)")
                    print("\n\n")
                    print("=================================")
                }
            }
        }
    }
    
  /*
    func setupPopularEvent(){
        socket?.on("popularScan") { (data, ack) in
            guard let dataInfo = data.first else { return }
            if let response: [PopularData] = try? SocketParser.convert(data: dataInfo) {
                for i in response
                {
                    print("Symbol: \(i.contractInfo!.symbol!)" )
                    print ( "Name: \(i.contractInfo!.name!)")
                    print ("Score: \(i.contractScan!)")
                    print ("Scans: \(i.interest!)")
                    print ("Verified: \(i.isNotListed)")
                    print("\n\n")
                    print("=================================")
                }
            }
        }
    }
    
    func setupScoreEvent(){
        
        socket?.on("highScore") { (data, ack) in
            guard let dataInfo = data.first else { return }
            if let response: [PopularData] = try? SocketParser.convert(data: dataInfo) {
                for i in response
                {
                    print("Symbol: \(i.contractInfo!.symbol!)" )
                    print ( "Name: \(i.contractInfo!.name!)")
                    print ("Score: \(i.contractScan!)")
                    print ("Scans: \(i.interest!)")
                    print ("Verified: \(i.isNotListed)")
                    print("\n\n")
                    print("=================================")
                }
            }
        }
        
    }
    
    func setupLastScanEvent(){
        
        socket?.on("latestScan") { (data, ack) in
            guard let dataInfo = data.first else { return }
            if let response: [PopularData] = try? SocketParser.convert(data: dataInfo) {
                for i in response
                {
                    print("Symbol: \(i.contractInfo!.symbol!)" )
                    print ( "Name: \(i.contractInfo!.name!)")
                    print ("Score: \(i.contractScan!)")
                    print ("Scans: \(i.interest!)")
                    print ("Verified: \(i.isNotListed)")
                    print("\n\n")
                    print("=================================")
                }
            }
        }
    }
    
    func setupRecentlyEvent(compltionHandeler: ( ([PopularData]?) ->() )? ){
        
        socket?.on("rcentlyAdded") { (data, ack) in
            guard let dataInfo = data.first else { return }
            if let response: [PopularData] = try? SocketParser.convert(data: dataInfo) {
                for i in response
                {
                    print("Symbol: \(i.contractInfo!.symbol!)" )
                    print ( "Name: \(i.contractInfo!.name!)")
                    print ("Score: \(i.contractScan!)")
                    print ("Scans: \(i.interest!)")
                    print ("Verified: \(i.isNotListed)")
                    print("\n\n")
                    print("=================================")
                }
            }
        }
    }
    */
    
  
    
  //End of class
}
