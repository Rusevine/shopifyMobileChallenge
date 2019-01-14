//
//  CollectionsViewController.swift
//  shopifyMobileChallenge
//
//  Created by Wiljay Flores on 2019-01-14.
//  Copyright © 2019 wiljay. All rights reserved.
//

import UIKit

class CollectionsViewController: UIViewController {
    
    let manager = DataManager()
    var collections = [Collection]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.getCollection { (collections) in
            for collection in collections {
                self.collections.append(collection as! Collection)
            }
            
        }

    }
    

}
