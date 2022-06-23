//
//  ScannerViewController.swift
//  Develocity
//
//  Created by Ahmed Soultan on 20/06/2022.
//

import UIKit

class ScannerViewController: UIViewController {
    
    let detailsTokenControllerView = detailsTokenVC()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupContainerView()
    }
    
    
    
    private func setupContainerView(){
        addChild(detailsTokenControllerView)
        view.addSubview(detailsTokenControllerView.view)
        detailsTokenControllerView.didMove(toParent: self)
        
        constrainForHolderView()
    }
    
    func constrainForHolderView()
    {
        detailsTokenControllerView.view.translatesAutoresizingMaskIntoConstraints = false
        detailsTokenControllerView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        detailsTokenControllerView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        detailsTokenControllerView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        detailsTokenControllerView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    

}
