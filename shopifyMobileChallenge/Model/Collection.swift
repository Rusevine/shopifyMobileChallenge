//
//  Collection.swift
//  shopifyMobileChallenge
//
//  Created by Wiljay Flores on 2019-01-13.
//  Copyright © 2019 wiljay. All rights reserved.
//

import UIKit

class Collection: NSObject {
    
    let collection_id: Int?
    let collection_name: String?
    let collection_image: UIImage?
    
    init(id: Int, name: String, image: [String:Any]) {
        self.collection_id = id
        self.collection_name = name
        
        let src = image["src"] as! String
        let imageURL = URL(string: src)
        
        do {
            let data = try Data(contentsOf: imageURL!)
            self.collection_image = UIImage(data: data)
        } catch let error {
            print("error unable to load data: \(error)")
            self.collection_image = nil
        }
    }
    
    
    
}
