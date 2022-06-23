//
//  DetailsTableViewCell.swift
//  Develocity
//
//  Created by Ahmed Soultan on 19/06/2022.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    
    static let cellIdentifier : String = "DetailsTableViewCell"
    
    static func nib() -> UINib
    {
        return UINib(nibName: "DetailsTableViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(){
        colorLabel.layer.masksToBounds = true
        colorLabel.layer.cornerRadius = 1.5
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = colorLabel.backgroundColor?.cgColor
        contentView.layer.borderWidth = 0.5
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
    }
    
}
