//
//  PopularTodayVC.swift
//  Develocity
//
//  Created by Hassan on 19/06/2022.
//

import UIKit

class PopularTodayVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var popularVM = PopularViewModel(eventName: .popular)
    var model : [PopularData] = []
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        popularVM.bindDataFromVMToVC = onSuccessSetData
        
        
        setupTable()
        
    }
    
    func setupTable()
    {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(HomeCell.nib(), forCellReuseIdentifier: HomeCell.cellIdentifier)
        
        tableView.register(HomeHeaderCell.nib(), forCellReuseIdentifier: HomeHeaderCell.cellIdentifier)
    }
    
    func onSuccessSetData()
    {
        model = popularVM.popularDataArray
        tableView.reloadData()
    }
    
}




extension PopularTodayVC : UITableViewDataSource , UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count 
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.cellIdentifier) as! HomeCell
        
        cell.configCell(popularData: model[indexPath.row])
        cell.rankLabel.text = String (indexPath.row + 1 )
        
     
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeHeaderCell.cellIdentifier) as! HomeHeaderCell
        
        return cell
    }
    
    
    
}
