//
//  UIImageView+ConvertURL.swift
//  Develocity
//
//  Created by Hassan on 12/06/2022.
//

import UIKit
extension UIImageView
{
    func setImgURL(url : String)
    {
        if let urlPostImg = URL(string: url)
        {
            let data = try! Data(contentsOf: urlPostImg)
            self.image = UIImage(data: data)
        }
    }
    
    func circuleImage()
    {
        self.layer.cornerRadius = self.frame.height / 2
    }
}
