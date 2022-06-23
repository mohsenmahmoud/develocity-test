//
//  ReportTableCell.swift
//  Develocity
//
//  Created by Hassan on 13/06/2022.
//

import UIKit

class ReportTableCell: UITableViewCell {
    
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameTagLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var precentgeLabel: UILabel!
    
    
    
    
    static let cellIdentifier : String = "ReportTableCell"
    
    static func nib() -> UINib
    {
        return UINib(nibName: "ReportTableCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
//  func ConfigurCell(report : ReportTable)
//    {
//        addressLabel.text = report.address
//        nameTagLabel.text = report.tagName
//        balanceLabel.text = report.balance
//        precentgeLabel.text = report.precentage
//    }
    
}
