//
//  RecentlyVerifiedHeader.swift
//  Develocity
//
//  Created by Hassan on 19/06/2022.
//

import UIKit

class RecentlyVerifiedHeader: UITableViewCell {

    
    static let cellIdentifier:String = "RecentlyVerifiedHeader"
   
    static func nib() -> UINib
    {
        UINib(nibName: "RecentlyVerifiedHeader", bundle: nil)
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
