//
//  PopularViewModel.swift
//  Develocity
//
//  Created by Hassan on 22/06/2022.
//

import Foundation
class PopularViewModel
{
    var socket : SocketMng
    
    var bindStateFromVMToVC : ()->() = {}
    var bindErrorFromVMToVC : ()->() = {}
    var bindCountFromVMToVC : ()->() = {}
    var bindDataFromVMToVC  : ()->() = {}
    
//    let eventName = "popularScan"
    
    var popularDataArray : [PopularData]!
    {
        didSet{
            bindDataFromVMToVC()
        }
    }
    
    var state:Bool!{
        didSet
        {
            bindStateFromVMToVC()
        }
    }
    
  
    init(eventName : Liseners)
    {
        socket = SocketMng.shared
        fetchData(eventName: eventName.rawValue)
    }
    
    
    
    
    func fetchData(eventName : String)
    {
        socket.setupEvents(eventName: eventName) { [weak self] arrayOfData in
            self?.state = false
            if let data = arrayOfData {
                self?.popularDataArray = data
            }
        }
    }
}
