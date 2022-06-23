//
//  RecentlyVerifiedCell.swift
//  Develocity
//
//  Created by Hassan on 19/06/2022.
//

import UIKit

class RecentlyVerifiedCell: UITableViewCell {

    static let cellIdentifier:String = "RecentlyVerifiedCell"
   
    static func nib() -> UINib
    {
        UINib(nibName: "RecentlyVerifiedCell", bundle: nil)
    }
    
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var verifiedImage: UIImageView!
   
       @IBOutlet weak var scoreLabel: UILabel!
        @IBOutlet weak var shortcutLabel: UILabel!
    @IBOutlet weak var verificationTimeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
