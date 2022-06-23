//
//  UIButton+CornerRaduis.swift
//  Develocity
//
//  Created by Hassan on 20/06/2022.
//

import UIKit

extension UIButton
{
    func cornerRaduis()
    {
        self.clipsToBounds = true
        self.layer.cornerRadius = 6
    }
}
