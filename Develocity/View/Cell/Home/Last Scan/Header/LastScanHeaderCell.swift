//
//  LastScanHeaderCell.swift
//  Develocity
//
//  Created by Hassan on 19/06/2022.
//

import UIKit

class LastScanHeaderCell: UITableViewCell {

    
    static let cellIdentifier:String = "LastScanHeaderCell"
   
    static func nib() -> UINib
    {
        UINib(nibName: "LastScanHeaderCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
