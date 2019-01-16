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
    var quantity: Int
    
    init(id: Int, name: String, variants: [[String:Any]], image: [String:Any]) {
        self.id = id
        self.name = name
        self.variants = variants
        
        let src = image["src"] as! String
        let imageURL = URL(string: src)
        
        do {
            let data = try Data(contentsOf: imageURL!)
            self.productImage = UIImage(data: data)
        } catch let error {
            print("error unable to load data: \(error)")
            self.productImage = nil
        }

        self.quantity = 0
        
        for variant in variants {
            let quantity = variant["inventory_quantity"] as! Int
            self.quantity += quantity
        }
    }
}
