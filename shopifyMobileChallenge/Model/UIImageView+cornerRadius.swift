//
//  File.swift
//  shopifyMobileChallenge
//
//  Created by Wiljay Flores on 2019-01-16.
//  Copyright © 2019 wiljay. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func circleImage() {
        
       self.layer.cornerRadius =  self.frame.size.height/2
        self.clipsToBounds = true
        
    }
    
    func setCornerRadiusAndBorder(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
    
}
