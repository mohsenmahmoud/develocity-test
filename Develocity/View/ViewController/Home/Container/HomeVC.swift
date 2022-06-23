//
//  HomeVC.swift
//  Develocity
//
//  Created by Hassan on 19/06/2022.
//

import UIKit
import SwiftUI



class HomeVC: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var popularTodayOutlet: UIButton!
    @IBOutlet weak var lastScanOutlet: UIButton!
    @IBOutlet weak var recentlyVerifiedOutlet: UIButton!
    @IBOutlet weak var childView: UIView!
    @IBOutlet weak var scoreOutlet: UIButton!
    
    let popularTodayVC     = PopularTodayVC()
    let lastScanVC         = LastScanVC()
    let recentlyVerifiedVC = RecentlyVerifiedVC()
    let scoreVC            = ScoreVC()
    
    let lightcolor = UIColor(red: 0xE8, green: 0xE8, blue: 0xE8)
    let darkColor  = UIColor(rgb: 0x8F63FF)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupButtons()
        recentlyVerifiedOutlet.alpha = 0.0
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "reportScreen" {
            let destinationVC = segue.destination as! ReportHomeViewController
            destinationVC.searchContractAddress = searchTextField.text ?? ""
        }
    }
    
    func setupButtons()
    {
        popularTodayOutlet.cornerRaduis()
        recentlyVerifiedOutlet.cornerRaduis()
        lastScanOutlet.cornerRaduis()
        scoreOutlet.cornerRaduis()
    }
    
    func setupView()
    {
        addChild(popularTodayVC)
        childView.addSubview(popularTodayVC.view)
        popularTodayVC.didMove(toParent: self)
        popularTodayOutlet.backgroundColor = darkColor
        popularTodayOutlet.tintColor = .white
        constrainForpopularToday()

        
    }
    
    
    @IBAction func searchBtnAction(_ sender: Any) {
        if searchTextField.text?.count == 42  {
            performSegue(withIdentifier: "reportScreen", sender: self)
        }
        
    }
    
    
    @IBAction func popularTodayAction(_ sender: Any) {
        
        popularTodayVC.didMove(toParent: nil)
        lastScanVC.didMove(toParent: nil)
        recentlyVerifiedVC.didMove(toParent: nil)
        childView.addSubview(popularTodayVC.view)
        constrainForpopularToday()
        
        popularTodayOutlet.tintColor = .white
        recentlyVerifiedOutlet.tintColor = .label
        lastScanOutlet.tintColor = .label
        scoreOutlet.tintColor = .label

        
        popularTodayOutlet.backgroundColor = darkColor
        recentlyVerifiedOutlet.backgroundColor = lightcolor
        lastScanOutlet.backgroundColor = lightcolor
        scoreOutlet.backgroundColor = lightcolor

    }
    
    
    
    @IBAction func scoreAction(_ sender: Any) {
     
        popularTodayVC.didMove(toParent: nil)
        recentlyVerifiedVC.didMove(toParent: nil)
        lastScanVC.didMove(toParent: nil)
        scoreVC.didMove(toParent: nil)

        childView.addSubview(scoreVC.view)
        constrainForScore()
        
        scoreOutlet.tintColor = .white
        lastScanOutlet.tintColor = .label
        recentlyVerifiedOutlet.tintColor = .label
        popularTodayOutlet.tintColor = .label
        
        scoreOutlet.backgroundColor = darkColor
        lastScanOutlet.backgroundColor = lightcolor
        recentlyVerifiedOutlet.backgroundColor = lightcolor
        popularTodayOutlet.backgroundColor = lightcolor
    }
    
    
    @IBAction func lastScanAction(_ sender: Any) {
        
        popularTodayVC.didMove(toParent: nil)
        recentlyVerifiedVC.didMove(toParent: nil)
        scoreVC.didMove(toParent: nil)
        childView.addSubview(lastScanVC.view)
        constrainForLastScan()
        
        lastScanOutlet.tintColor = .white
        recentlyVerifiedOutlet.tintColor = .label
        popularTodayOutlet.tintColor = .label
        scoreOutlet.tintColor = .label

        
        lastScanOutlet.backgroundColor = darkColor
        recentlyVerifiedOutlet.backgroundColor = lightcolor
        popularTodayOutlet.backgroundColor = lightcolor
        scoreOutlet.backgroundColor = lightcolor
        
    }
    
    
    @IBAction func recentlyVerifiedAction(_ sender: Any) {
        popularTodayVC.didMove(toParent: nil)
        lastScanVC.didMove(toParent: nil)
        scoreVC.didMove(toParent: nil)

        childView.addSubview(recentlyVerifiedVC.view)
        constrainForRecentlyVerified()
        
        
        recentlyVerifiedOutlet.tintColor = .white
        popularTodayOutlet.tintColor = .label
        lastScanOutlet.tintColor = .label
        scoreOutlet.tintColor = .label

        
        recentlyVerifiedOutlet.backgroundColor = darkColor
        popularTodayOutlet.backgroundColor = lightcolor
        lastScanOutlet.backgroundColor = lightcolor
        scoreOutlet.backgroundColor = lightcolor

        
        

        
    }
    
    
    func constrainForpopularToday()
    {
        popularTodayVC.view.translatesAutoresizingMaskIntoConstraints = false
        popularTodayVC.view.bottomAnchor.constraint(equalTo: childView.bottomAnchor).isActive = true
        
        popularTodayVC.view.topAnchor.constraint(equalTo: childView.topAnchor).isActive = true
        
        popularTodayVC.view.leadingAnchor.constraint(equalTo: childView.leadingAnchor).isActive = true
        
        popularTodayVC.view.trailingAnchor.constraint(equalTo: childView.trailingAnchor).isActive = true
    }
    
    
    func constrainForLastScan()
    {
        lastScanVC.view.translatesAutoresizingMaskIntoConstraints = false
        lastScanVC.view.bottomAnchor.constraint(equalTo: childView.bottomAnchor).isActive = true
        
        lastScanVC.view.topAnchor.constraint(equalTo: childView.topAnchor).isActive = true
        
        lastScanVC.view.leadingAnchor.constraint(equalTo: childView.leadingAnchor).isActive = true
        
        lastScanVC.view.trailingAnchor.constraint(equalTo: childView.trailingAnchor).isActive = true
    }
    
    
    func constrainForRecentlyVerified()
    {
        recentlyVerifiedVC.view.translatesAutoresizingMaskIntoConstraints = false
        recentlyVerifiedVC.view.bottomAnchor.constraint(equalTo: childView.bottomAnchor).isActive = true
        
        recentlyVerifiedVC.view.topAnchor.constraint(equalTo: childView.topAnchor).isActive = true
        
        recentlyVerifiedVC.view.leadingAnchor.constraint(equalTo: childView.leadingAnchor).isActive = true
        
        recentlyVerifiedVC.view.trailingAnchor.constraint(equalTo: childView.trailingAnchor).isActive = true
    }
    
    
    func constrainForScore()
    {
        scoreVC.view.translatesAutoresizingMaskIntoConstraints = false
        scoreVC.view.bottomAnchor.constraint(equalTo: childView.bottomAnchor).isActive = true
        
        scoreVC.view.topAnchor.constraint(equalTo: childView.topAnchor).isActive = true
        
        scoreVC.view.leadingAnchor.constraint(equalTo: childView.leadingAnchor).isActive = true
        
        scoreVC.view.trailingAnchor.constraint(equalTo: childView.trailingAnchor).isActive = true
    }
}


