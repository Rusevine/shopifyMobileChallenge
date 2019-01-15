//
//  Product.swift
//  shopifyMobileChallenge
//
//  Created by Wiljay Flores on 2019-01-15.
//  Copyright © 2019 wiljay. All rights reserved.
//

import UIKit

class Product: NSObject {
    let id: Int?
    let name: String?
    let variants:[[String:Any]]
    let productImage: UIImage?
    let quantity: Int?
    
    init(id: Int, name: String, variants: [[String:Any]], image: [String:Any]) {
        self.id = id
        self.name = name
        self.variants = variants
        self.productImage = nil
        self.quantity = 0
    }
}
