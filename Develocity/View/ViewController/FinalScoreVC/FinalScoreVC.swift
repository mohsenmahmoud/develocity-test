//
//  FinalScoreVC.swift
//  Develocity
//
//  Created by Ahmed Soultan on 19/06/2022.
//

import UIKit

class FinalScoreVC: UIViewController {

//    @IBOutlet weak var firstStackView: UIStackView!
    @IBOutlet weak var firstPartContainerView: UIView!
    
    @IBOutlet weak var progressBarContainerView: UIView!
    @IBOutlet weak var progressPercentageLabel: UILabel!
    
    @IBOutlet weak var criticalProblemsNumberLabel: UILabel!
    @IBOutlet weak var importantProblemsNumberLabel: UILabel!
    @IBOutlet weak var informationalProblemsNumberLabel: UILabel!
    @IBOutlet weak var criticalColorLabel: UILabel!
    @IBOutlet weak var importantColorLabel: UILabel!
    @IBOutlet weak var informationalColorLabel: UILabel!
    
    
    @IBOutlet weak var problemsCollectionView: UICollectionView!
    
    @IBOutlet weak var detailsTableView: UITableView!
    
    var circularProgressBarView: CircularProgressBarView!
    var circularViewDuration: TimeInterval = 1
    var totalScoreValue:NSNumber = 0{
        didSet{
            self.setUpCircularProgressBarView(circuleColor: UIColor().hexStringToUIColor(hex: "#16C784"), strokeColor: UIColor().hexStringToUIColor(hex: "#CBD3E1"), progressValue: totalScoreValue)
        }
    }
    
    class TableRowData{
        var title: String?
        var description: String?
        var boolVal: Bool?
    }
    
    var tableDataArray = [TableRowData](){
        didSet{
            DispatchQueue.main.async {
                self.detailsTableView.reloadData()
            }
        }
    }
    
    
    let problemsColors = [UIColor().hexStringToUIColor(hex: "#EA3943"),
                          UIColor().hexStringToUIColor(hex: "#FFA51D") ,
                          UIColor().hexStringToUIColor(hex: "#707070") ,
                          UIColor().hexStringToUIColor(hex: "#16C784")]
    
    let cellsTitles = ["Contract" , "Liquidity" , "General"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        problemsCollectionView.dataSource = self
        problemsCollectionView.delegate = self
        problemsCollectionView.register(ProblemsCollectionViewCell.nib(), forCellWithReuseIdentifier: ProblemsCollectionViewCell.cellIdentifier)
        
        detailsTableView.dataSource = self
        detailsTableView.delegate = self
        detailsTableView.register(DetailsTableViewCell.nib(), forCellReuseIdentifier: DetailsTableViewCell.cellIdentifier)
        
        //Setup stack frame
        firstPartContainerView.layer.cornerRadius = 8
        firstPartContainerView.layer.borderWidth = 0.5
        firstPartContainerView.layer.borderColor = UIColor.lightGray.cgColor
        firstPartContainerView.layer.cornerCurve = .continuous
        
        //Setup ColorViews
        criticalColorLabel.layer.cornerRadius = criticalColorLabel.frame.height / 2
        criticalColorLabel.layer.masksToBounds = true
        importantColorLabel.layer.cornerRadius = criticalColorLabel.frame.height / 2
        importantColorLabel.layer.masksToBounds = true
        informationalColorLabel.layer.cornerRadius = criticalColorLabel.frame.height / 2
        informationalColorLabel.layer.masksToBounds = true
        
    }
    
    private func setUpCircularProgressBarView(circuleColor: UIColor , strokeColor: UIColor , progressValue:NSNumber) {
        // set view
        circularProgressBarView = CircularProgressBarView(frame: .zero, radius:(progressPercentageLabel.layer.frame.width + 10), value: progressValue, circuleColor: circuleColor.cgColor, strokeColor: strokeColor.cgColor , lineWidth: 10)
        // align to the center of the screen
        circularProgressBarView.center = self.progressPercentageLabel.center
        // call the animation with circularViewDuration
        circularProgressBarView.progressAnimation(duration: circularViewDuration)
        
        let c:Float = Float(truncating: circularProgressBarView.value!)
        let i:Int = Int(c * 100)
        progressPercentageLabel.text = String(i) + "" + "%"
//        percentageLabel.textColor = circuleColor
        // add this view to the view controller
        self.progressBarContainerView.addSubview(circularProgressBarView)
        
        circularProgressBarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circularProgressBarView.centerXAnchor.constraint(equalTo: self.progressPercentageLabel.centerXAnchor),
            circularProgressBarView.centerYAnchor.constraint(equalTo: self.progressPercentageLabel.centerYAnchor),
        ])
    }

}

extension FinalScoreVC:UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let problemCell = problemsCollectionView.dequeueReusableCell(withReuseIdentifier: ProblemsCollectionViewCell.cellIdentifier, for: indexPath) as! ProblemsCollectionViewCell
        let randomNumber = Float.random(in: 0.3...0.99)
        problemCell.setupCell(mainColor: problemsColors[indexPath.row], progressValue: randomNumber as NSNumber)
        problemCell.cellTitleLabel.text = cellsTitles[indexPath.row]
        return problemCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let problemCell = problemsCollectionView.cellForItem(at: indexPath)
        problemCell?.layer.borderColor = problemsColors[indexPath.row].cgColor
        problemCell?.layer.borderWidth = 3
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let problemCell = problemsCollectionView.cellForItem(at: indexPath)
        problemCell?.layer.borderWidth = 0.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: problemsCollectionView.frame.width / 3.2, height: problemsCollectionView.frame.height - 10)
    }
    
}

extension FinalScoreVC:UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detailsCell = detailsTableView.dequeueReusableCell(withIdentifier: DetailsTableViewCell.cellIdentifier, for: indexPath) as! DetailsTableViewCell
        
        detailsCell.titleLabel.text = tableDataArray[indexPath.row].title
        detailsCell.detailsLabel.text = tableDataArray[indexPath.row].description
        
        if tableDataArray[indexPath.row].boolVal == true {
            detailsCell.colorLabel.backgroundColor = problemsColors[3]
        } else {
            detailsCell.colorLabel.backgroundColor = problemsColors[0]
        }
        detailsCell.setupCell()
        
        return detailsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
