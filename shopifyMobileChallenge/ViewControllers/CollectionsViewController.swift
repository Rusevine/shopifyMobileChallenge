//
//  CollectionsViewController.swift
//  shopifyMobileChallenge
//
//  Created by Wiljay Flores on 2019-01-14.
//  Copyright © 2019 wiljay. All rights reserved.
//

import UIKit

class CollectionsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionsCollectionView: UICollectionView!
 
    var collections = [Collection]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        DataManager.getCollections { (collections) in
            
            self.collections = collections as! [Collection]
            
            OperationQueue.main.addOperation {
                self.collectionsCollectionView.reloadData()
            }
            
        }

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        DataManager.getCollections { (collections) in
//
//            self.collections = collections as! [Collection]
//
//
//            OperationQueue.main.addOperation {
//                self.collectionsCollectionView.reloadData()
//            }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionsCollectionView.dequeueReusableCell(withReuseIdentifier: "collectionsCell", for: indexPath) as! CollectionsCollectionViewCell
        
        cell.configureCellWith(collection: collections[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.height/2)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "collectionToProduct" {
            let collectionViewCell = sender as! UICollectionViewCell
            let vc = segue.destination as! ProductsViewController
            guard let indexPath = collectionsCollectionView.indexPath(for: collectionViewCell) else {return}
            vc.collection = collections[indexPath.row]
            
            }
            
        }

}
