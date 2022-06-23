//
//  MenuHomeViewController.swift
//  Develocity
//
//  Created by Ahmed Soultan on 20/06/2022.
//

import UIKit

class MenuHomeViewController: UIViewController {

    let menuControllerView = menuVC()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupContainerView()
    }
    
    
    
    private func setupContainerView(){
        addChild(menuControllerView)
        view.addSubview(menuControllerView.view)
        menuControllerView.didMove(toParent: self)
        
        constrainForHolderView()
    }
    
    func constrainForHolderView()
    {
        menuControllerView.view.translatesAutoresizingMaskIntoConstraints = false
        menuControllerView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        menuControllerView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        menuControllerView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuControllerView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    

}
