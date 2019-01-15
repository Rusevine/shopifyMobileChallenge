//
//  CollectionsCollectionViewCell.swift
//  shopifyMobileChallenge
//
//  Created by Wiljay Flores on 2019-01-14.
//  Copyright © 2019 wiljay. All rights reserved.
//

import UIKit

class CollectionsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionImage: UIImageView!
    
    func configureCellWith(collection: Collection) {
        self.collectionImage.image = collection.collectionImage
        
    }
    
}
