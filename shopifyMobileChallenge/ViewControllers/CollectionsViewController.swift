//
//  CollectionsViewController.swift
//  shopifyMobileChallenge
//
//  Created by Wiljay Flores on 2019-01-14.
//  Copyright © 2019 wiljay. All rights reserved.
//

import UIKit

class CollectionsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionsCollectionView: UICollectionView!
    let manager = DataManager()
    var collections = [Collection]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.getCollection { (collections) in
            for collection in collections {
                self.collections.append(collection as! Collection)
            }
            
            OperationQueue.main.addOperation {
                self.collectionsCollectionView.reloadData()
            }
            
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionsCollectionView.dequeueReusableCell(withReuseIdentifier: "collectionsCell", for: indexPath) as! CollectionsCollectionViewCell
        
        cell.configureCellWith(collection: collections[indexPath.row])
        
        return cell
    }

}
