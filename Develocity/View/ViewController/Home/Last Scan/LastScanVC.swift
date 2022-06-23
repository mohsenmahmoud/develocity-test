//
//  LastScanVC.swift
//  Develocity
//
//  Created by Hassan on 19/06/2022.
//

import UIKit

class LastScanVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var popularVM = PopularViewModel(eventName: .scan)
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
        
        tableView.register(LastScanCell.nib(), forCellReuseIdentifier: LastScanCell.cellIdentifier)
        
        tableView.register(LastScanHeaderCell.nib(), forCellReuseIdentifier: LastScanHeaderCell.cellIdentifier)
    }
    
    func onSuccessSetData()
    {
        model = popularVM.popularDataArray
        tableView.reloadData()
    }
}

extension LastScanVC : UITableViewDataSource , UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LastScanCell.cellIdentifier) as! LastScanCell
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: LastScanHeaderCell.cellIdentifier) as! LastScanHeaderCell
        
        return cell
    }
}
