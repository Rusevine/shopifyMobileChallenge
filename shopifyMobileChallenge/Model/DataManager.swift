//
//  ServerManager.swift
//  shopifyMobileChallenge
//
//  Created by Wiljay Flores on 2019-01-13.
//  Copyright © 2019 wiljay. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    enum RequestType {
        case GetCollection
        case GetProductID
        case GetProduct
    }
    
    class func getCollections(completion: @escaping ([Any]) -> ()) {
        
        let url = URL(string: "https://shopicruit.myshopify.com/admin/custom_collections.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6")
        let urlRequest = URLRequest(url: url!)
        
        jsonParse(request: urlRequest, requestType: .GetCollection) { (collections) in
            completion(collections)
        }
    }
    
    class func getProducts(collectionID: Int, completion: @escaping ([Any]) -> ()) {
        
        let url = URL(string: "https://shopicruit.myshopify.com/admin/collects.json?collection_id=\(collectionID)&page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6")
        
        let urlRequest = URLRequest(url: url!)
        
        jsonParse(request: urlRequest, requestType: .GetProductID) { (ids) in
            let ids = ids as! [Int]
            let idStrings = ids.map{String($0)}
            let productList = idStrings.joined(separator: ",")
            
            let url = URL(string: "https://shopicruit.myshopify.com/admin/products.json?ids=\(productList)&page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6")
            
            let urlRequest = URLRequest(url: url!)
            
            self.jsonParse(request: urlRequest, requestType: .GetProduct) { (products) in
                completion(products)
            }
        }
        
        
    }
    
    private class func jsonParse(request: URLRequest, requestType: RequestType, completion: @escaping ([Any]) -> ()) {
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard error == nil else {
                print("error found")
                return
            }
            
            guard let content = data else {
                print("data not found")
                return
            }
            
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String:Any] else {
                print("error parsing json")
                return
            }
            
            switch(requestType){
                case .GetCollection:
                    completion(self.parseCollection(json: json))
                break
                case .GetProductID:
                    completion(self.parseProductID(json: json))
                break
                case .GetProduct:
                    completion(self.parseProduct(json: json))
                break
            }
        }
        task.resume()
    }
    
    private class func parseCollection(json: [String:Any]) -> [Collection] {
        
        var collections = [Collection]()
        
        if let collectionsArray = json["custom_collections"] as? [[String:Any]] {
            for collection in collectionsArray {
                
                let image = collection["image"] as! [String:Any]
                let id = collection["id"] as! Int
                let name = collection["title"] as! String
                
                collections.append(Collection(id: id, name: name, image: image))
            }
            
        }
        return collections
    }
    
    private class func parseProductID(json: [String:Any]) -> [Int] {
        
        var ids = [Int]()
        
        if let products = json["collects"] as? [[String:Any]] {
            for product in products {
                let id = product["product_id"] as! Int
                
                ids.append(id)
            }
        }
        return ids
    }
    
    private class func parseProduct(json: [String:Any]) -> [Product] {
        
        var products = [Product]()
        
        if let productsArray = json["products"] as? [[String:Any]] {
            for product in productsArray {
                
                let image = product["image"] as! [String:Any]
                let id = product["id"] as! Int
                let name = product["title"] as! String
                let variants = product["variants"] as! [[String:Any]]
                
                products.append(Product(id: id, name: name, variants: variants, image: image))
            }
        }
        return products
    }
    
}
