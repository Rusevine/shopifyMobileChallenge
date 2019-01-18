//
//  UIView+cornerRadius.swift
//  shopifyMobileChallenge
//
//  Created by Wiljay Flores on 2019-01-18.
//  Copyright © 2019 wiljay. All rights reserved.
//

import UIKit

extension UIView {
    
    func setCornerRadiusAndBorder(radius: CGFloat, borderWidth: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = UIColor.black.cgColor
    }
    
}
