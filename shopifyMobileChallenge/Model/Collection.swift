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
        self.collection_image = nil
    }
    
}
