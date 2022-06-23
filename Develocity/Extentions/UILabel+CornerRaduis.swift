//
//  UILabel+CornerRaduis.swift
//  Develocity
//
//  Created by Hassan on 20/06/2022.
//

import UIKit


extension UILabel
{
    
    
    func circle()
    {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.layer.frame.height / 2
    }
    
    func redColor()
    {
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 234/255, green: 57/255, blue: 67/255, alpha: 0.30).cgColor
        self.textColor = UIColor(red: 234/255, green: 57/255, blue: 67/255, alpha: 1.0)
        self.backgroundColor = UIColor(red: 234/255, green: 57/255, blue: 67/255, alpha: 0.15)
    }
 
    func greenColor()
    {
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 22/255, green: 199/255, blue: 132/255, alpha: 0.30).cgColor
        self.backgroundColor = UIColor(red: 22/255, green: 199/255, blue: 132/255, alpha: 0.10)
        self.textColor = UIColor(red: 22/255, green: 199/255, blue: 132/255, alpha: 1.0)
    }
    
    func yellowColor()
    {
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 255/255, green: 165/255, blue: 29/255, alpha: 0.30).cgColor
        self.backgroundColor = UIColor(red: 255/255, green: 165/255, blue: 29/255, alpha: 0.10)
        self.textColor = UIColor(red: 255/255, green: 165/255, blue: 29/255, alpha: 1.0)
    }
    
    func cornerRaduisForRank()
    {
        self.clipsToBounds = true
        self.layer.cornerRadius = 2
    }
}
