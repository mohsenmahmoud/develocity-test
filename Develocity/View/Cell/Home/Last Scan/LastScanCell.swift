//
//  LastScanCell.swift
//  Develocity
//
//  Created by Hassan on 19/06/2022.
//

import UIKit

class LastScanCell: UITableViewCell {

    let dateFormatter = DateFormatter()
    let todayDate = Date()
    let calendar = Calendar.current

    static let cellIdentifier:String = "LastScanCell"
   
    static func nib() -> UINib
    {
        UINib(nibName: "LastScanCell", bundle: nil)
    }
    
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var verifiedImage: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
   
       @IBOutlet weak var scoreLabel: UILabel!
        @IBOutlet weak var shortcutLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!

    @IBOutlet weak var firsLetterLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        rankLabel.cornerRaduisForRank()
        firsLetterLabel.backgroundColor = UIColor(red: 143/255, green: 99/255, blue: 255/255, alpha: 0.10)
        firsLetterLabel.circle()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configCell(popularData p:PopularData)
    {
        coinNameLabel.text = p.contractInfo?.name
        shortcutLabel.text = p.contractInfo?.symbol
       
        if let firstLetter = p.contractInfo?.name?.first
        {
            firsLetterLabel.text = String(firstLetter)
        }
        
        
        
        if let scoreNum = p.contractScan
        {
            let s =  Int (scoreNum.rounded() )
            switch s
            {
            case 85 ... 100:
                scoreLabel.greenColor()
                
            case 60 ... 84:
                scoreLabel.yellowColor()
                
            case 0 ... 59:
                scoreLabel.redColor()
                
            default: break
                
            }
            scoreLabel.text  = String(s)
        }else
        {
            scoreLabel.text = "0"
            scoreLabel.redColor()

        }
        
        
        if p.isNotListed ?? false
        {
            verifiedImage.isHidden = false
        }else
        {
            verifiedImage.isHidden = true

        }
        print(p.createdAt)
        
       // "2022-06-22T12:04:10.350Z"
        self.dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let updateDate = dateFormatter.date(from: p.createdAt!)
        let components = calendar.dateComponents([.minute], from: updateDate!, to: todayDate)
        print(components)
        if let hour = components.minute
        {
            timeAgoLabel.text = String(hour) + "m"
        }
        
        let delta = updateDate!.distance(to: todayDate)
        print(delta)
        print(updateDate)
        print(todayDate)
        
    }
}
