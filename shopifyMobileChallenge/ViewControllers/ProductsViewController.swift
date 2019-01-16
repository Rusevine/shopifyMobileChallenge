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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        //return view.frame.size.height/8
        return 85
    }
    
    
}
