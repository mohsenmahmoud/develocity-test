//
//  ViewController.swift
//  Develocity
//
//  Created by mohsen on 19/06/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
 
    @IBAction func action(_ sender: Any) {
        
        let vc = menuVC(nibName: "menuVC", bundle: nil)
        present(vc, animated: true)
    }
    
}
