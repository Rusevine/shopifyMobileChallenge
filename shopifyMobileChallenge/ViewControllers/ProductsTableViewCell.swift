//
//  ProductsTableViewCell.swift
//  shopifyMobileChallenge
//
//  Created by Wiljay Flores on 2019-01-15.
//  Copyright © 2019 wiljay. All rights reserved.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productInfoContainer: UIView!
    
    func configureCellWith(product: Product) {
        nameLabel.text = product.name
        quantityLabel.text = "Quantity: " + String(product.quantity)
        productImageView.image = product.productImage
        
        productInfoContainer.layer.cornerRadius = 5
        productImageView.setCornerRadiusAndBorder(radius: 5)
    }

}
