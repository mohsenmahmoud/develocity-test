//
//  ProblemsCollectionViewCell.swift
//  Develocity
//
//  Created by Ahmed Soultan on 19/06/2022.
//

import UIKit

class ProblemsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var cellTitleLabel: UILabel!
    
    var circularProgressBarView: CircularProgressBarView!
    var circularViewDuration: TimeInterval = 1
    
    static let cellIdentifier : String = "ProblemsCollectionViewCell"
    
    static func nib() -> UINib
    {
        return UINib(nibName: "ProblemsCollectionViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    func setupCell(mainColor: UIColor , progressValue:NSNumber) {
        
//        cellTitleLabel.textColor = mainColor
        setUpCircularProgressBarView(circuleColor: mainColor, strokeColor: UIColor.clear , progressValue: progressValue)
//        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 7
        self.layer.shadowOpacity = 0.1
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3 )
        self.layer.borderWidth = 0.5
        self.layer.borderColor = mainColor.cgColor
    }
    
    
    func setUpCircularProgressBarView(circuleColor: UIColor , strokeColor: UIColor , progressValue:NSNumber) {
        // set view
        circularProgressBarView = CircularProgressBarView(frame: .zero, radius:(percentageLabel.frame.height + 10), value: progressValue, circuleColor: circuleColor.cgColor, strokeColor: strokeColor.cgColor , lineWidth: 6)
        // align to the center of the screen
        circularProgressBarView.center = self.percentageLabel.center
        // call the animation with circularViewDuration
        circularProgressBarView.progressAnimation(duration: circularViewDuration)
        
        let c:Float = Float(truncating: circularProgressBarView.value!)
        let i:Int = Int(c * 100)
        percentageLabel.text = String(i) + "" + "%"
//        percentageLabel.textColor = circuleColor
        // add this view to the view controller
        self.contentView.addSubview(circularProgressBarView)
        
        circularProgressBarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circularProgressBarView.centerXAnchor.constraint(equalTo: self.percentageLabel.centerXAnchor),
            circularProgressBarView.centerYAnchor.constraint(equalTo: self.percentageLabel.centerYAnchor),
        ])
    }

}
