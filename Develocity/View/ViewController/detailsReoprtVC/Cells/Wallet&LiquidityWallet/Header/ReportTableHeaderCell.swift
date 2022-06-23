//
//  ReportTableHeaderCell.swift
//  Develocity
//
//  Created by Hassan on 13/06/2022.
//

import UIKit

class ReportTableHeaderCell: UITableViewCell {

    
    static let cellIdentifier : String = "ReportTableHeaderCell"
    
    static func nib() -> UINib
    {
        return UINib(nibName: "ReportTableHeaderCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
