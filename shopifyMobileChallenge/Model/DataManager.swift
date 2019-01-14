//
//  ServerManager.swift
//  shopifyMobileChallenge
//
//  Created by Wiljay Flores on 2019-01-13.
//  Copyright © 2019 wiljay. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    enum DataType {
        case CollectionInfo
        case ProductInCollection
        case ProductInfo
    }
    
    func getCollection(completion: @escaping ([Any]) -> ()) {
        
        let url = URL(string: "https://shopicruit.myshopify.com/admin/custom_collections.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6")
        let urlRequest = URLRequest(url: url!)
        
        jsonParse(request: urlRequest, dataType: .CollectionInfo) { (collections) in
            completion(collections)
        }
    }
    
    func jsonParse(request: URLRequest, dataType: DataType, completion: @escaping ([Any]) -> ()) {
        
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
            
            switch(dataType){
                case .CollectionInfo:
                    completion(self.parseCollection(json: json))
                break
                default:
                    print("incorrect data")
                break
            }
        }
        task.resume()
    }
    
    func parseCollection(json: [String:Any]) -> [Collection] {
        
        var collections = [Collection]()
        
        if let collectionsArray = json["custom_collections"] as? [[String:Any]] {
            for collection in collectionsArray {
                
                let image = collection["image"] as? [String:Any]
                let id = collection["id"] as? Int
                let name = collection["title"] as? String
                
                let collection = Collection(id: id!, name: name!, image: image!)
                
                collections.append(collection)
            }
            
        }
        return collections
    }
    
}
