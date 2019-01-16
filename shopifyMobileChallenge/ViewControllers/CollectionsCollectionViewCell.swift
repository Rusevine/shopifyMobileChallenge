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
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var collectionContainer: UIView!
    @IBOutlet weak var imageViewContainer: UIView!
    
    
    func configureCellWith(collection: Collection) {
        self.collectionImage.image = collection.collectionImage
        self.collectionNameLabel.text = collection.name
        self.collectionImage.setCornerRadiusAndBorder(radius: 5)
        self.collectionContainer.layer.cornerRadius = 5
        self.imageViewContainer.layer.cornerRadius = 5
    }
    
    
}
