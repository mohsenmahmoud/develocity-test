//
//  LivePairsVC.swift
//  Develocity
//
//  Created by Hassan on 19/06/2022.
//

import UIKit

class LivePairsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

      setupTable()
    }
    
    func setupTable()
    {
        
        
        tableView.register(LastScanCell.nib(), forCellReuseIdentifier: LastScanCell.cellIdentifier)
        
        tableView.register(LivePairsHeaderCell.nib(), forCellReuseIdentifier: LivePairsHeaderCell.cellIdentifier)
    }


}
extension LivePairsVC : UITableViewDataSource , UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LastScanCell.cellIdentifier) as! LastScanCell
        
        switch indexPath.row
        {
        case 0 ... 2:
            cell.scoreLabel.greenColor()
        case 3 ... 5:
            cell.scoreLabel.redColor()

        case 6 ... 9:
            cell.scoreLabel.yellowColor()
            
        default:
            cell.scoreLabel.greenColor()

        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: LivePairsHeaderCell.cellIdentifier) as! LivePairsHeaderCell
        
        return cell
    }
}
