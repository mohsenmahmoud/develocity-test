//
//  detailsTokenVC.swift
//  Develocity
//
//  Created by mohsen on 20/06/2022.
//

import UIKit

class detailsTokenVC: UIViewController {

    @IBOutlet weak var topWalletsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupScreen()
    }
    
    private func setupScreen(){
        topWalletsTableView.dataSource = self
        topWalletsTableView.delegate = self
        topWalletsTableView.register(ReportTableCell.nib(), forCellReuseIdentifier:ReportTableCell.cellIdentifier)
        topWalletsTableView.register(ReportTableHeaderCell.nib(), forCellReuseIdentifier:ReportTableHeaderCell.cellIdentifier)
    }

 

}

extension detailsTokenVC: UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reportCell = topWalletsTableView.dequeueReusableCell(withIdentifier: ReportTableCell.cellIdentifier, for: indexPath) as! ReportTableCell
        
        
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
