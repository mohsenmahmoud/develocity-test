//
//  RecentlyVerifiedVC.swift
//  Develocity
//
//  Created by Hassan on 19/06/2022.
//

import UIKit

class RecentlyVerifiedVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()    }
    
    func setupTable()
    {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(RecentlyVerifiedCell.nib(), forCellReuseIdentifier: RecentlyVerifiedCell.cellIdentifier)
        
        tableView.register(RecentlyVerifiedHeader.nib(), forCellReuseIdentifier: RecentlyVerifiedHeader.cellIdentifier)
    }
    
    
}

extension RecentlyVerifiedVC : UITableViewDataSource , UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecentlyVerifiedCell.cellIdentifier) as! RecentlyVerifiedCell
        switch indexPath.row
        {
        case 0 ... 2:
            cell.scoreLabel.redColor()

        case 3 ... 5:
            cell.scoreLabel.yellowColor()


        case 6 ... 9:
            cell.scoreLabel.greenColor()

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
        let cell = tableView.dequeueReusableCell(withIdentifier: RecentlyVerifiedHeader.cellIdentifier) as! RecentlyVerifiedHeader
        
        return cell
    }
}
