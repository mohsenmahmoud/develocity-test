//
//  LivePairsHeaderCell.swift
//  Develocity
//
//  Created by Hassan on 19/06/2022.
//

import UIKit

class LivePairsHeaderCell: UITableViewCell {

    
    static let cellIdentifier:String = "LivePairsHeaderCell"
   
    static func nib() -> UINib
    {
        UINib(nibName: "LivePairsHeaderCell", bundle: nil)
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
