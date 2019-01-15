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
    let dataManager = DataManager()
    var collections = [Collection]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataManager.getCollections { (collections) in

            self.collections = collections as! [Collection]
            
            OperationQueue.main.addOperation {
                self.collectionsCollectionView.reloadData()
            }
            
        }
        
        dataManager.getProducts(collectionID: 68424728632) { (products) in
            
            let products = products as! [Product]
            for product in products {
                print(product.name)
            }
            print(products.count)
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
