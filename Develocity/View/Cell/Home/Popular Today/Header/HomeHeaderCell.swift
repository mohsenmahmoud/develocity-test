//
//  HomeHeaderCell.swift
//  Develocity
//
//  Created by Hassan on 19/06/2022.
//

import UIKit

class HomeHeaderCell: UITableViewCell {

    @IBOutlet weak var scansLabel: UILabel!
   
    
    static let cellIdentifier:String = "HomeHeaderCell"
    
    
    static func nib() -> UINib
    {
        UINib(nibName: "HomeHeaderCell", bundle: nil)
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
