//
//  ProductsViewController.swift
//  shopifyMobileChallenge
//
//  Created by Wiljay Flores on 2019-01-15.
//  Copyright © 2019 wiljay. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var products = [Product]()
    var collection: Collection?
    @IBOutlet weak var productsTableView: UITableView!
    
    @IBOutlet weak var collectionImageView: UIImageView!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var collectionBodyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionImageView.image = collection?.collectionImage
        self.collectionNameLabel.text = "\(collection?.name ?? "") Collection"
        self.collectionBodyLabel.text = collection?.body
        self.collectionImageView.layer.cornerRadius = self.collectionImageView.frame.width/2
        self.collectionImageView.layer.borderWidth = 1.5
        self.collectionImageView.layer.borderColor = UIColor.black.cgColor
        self.collectionImageView.clipsToBounds = true
        
        guard let id = collection?.id else {return}
        DataManager.getProducts(collectionID: id) { (products) in
            self.products = products as! [Product]
            
            OperationQueue.main.addOperation {
                self.productsTableView.reloadData()
            }
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productsTableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductsTableViewCell
        
        cell.configureCellWith(product: products[indexPath.row])
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    
}
