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
    let body: String?
    
    init(id: Int, name: String, image: [String:Any], body: String) {
        
        let collectionName = name.components(separatedBy: " ").first
        
        self.name = collectionName
        self.id = id
        self.body = body
        
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
