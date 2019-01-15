//
//  Collection.swift
//  shopifyMobileChallenge
//
//  Created by Wiljay Flores on 2019-01-13.
//  Copyright © 2019 wiljay. All rights reserved.
//

import UIKit

class Collection: NSObject {
    
    let id: Int?
    let name: String?
    let collectionImage: UIImage?
    
    init(id: Int, name: String, image: [String:Any]) {
        self.id = id
        self.name = name
        
        let src = image["src"] as! String
        let imageURL = URL(string: src)
        
        do {
            let data = try Data(contentsOf: imageURL!)
            self.collectionImage = UIImage(data: data)
        } catch let error {
            print("error unable to load data: \(error)")
            self.collectionImage = nil
        }
    }
    
    
    
}
