//
//  Collection.swift
//  shopifyMobileChallenge
//
//  Created by Wiljay Flores on 2019-01-13.
//  Copyright © 2019 wiljay. All rights reserved.
//

import UIKit

class Collection: NSObject {
    let collection_id: String?
    let collection_title: String?
    let collection_image: UIImage?
    
    init(attributes: [String:Any]) {
        self.collection_id = attributes["collection_id"] as? String
        self.collection_title = attributes["collection_title"] as? String
        self.collection_image = nil
    }
    
}
