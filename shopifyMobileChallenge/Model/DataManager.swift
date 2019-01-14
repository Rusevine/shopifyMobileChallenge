//
//  ServerManager.swift
//  shopifyMobileChallenge
//
//  Created by Wiljay Flores on 2019-01-13.
//  Copyright © 2019 wiljay. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
//    private let access_token: String
//
//    override init() {
//      self.access_token = "c32313df0d0ef512ca64d5b336a0d7c6"
//    }
    
    func getCollection() {
        
        var collections = [String:Any]()
        
      let url = URL(string: "https://shopicruit.myshopify.com/admin/custom_collections.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6")
      let urlRequest = URLRequest(url: url!)
    
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
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
            
            if let collectionsArray = json["custom_collections"] as? [[String:Any]] {
                for collection in collectionsArray {
                    print(collection["id"] ?? "")
                    print(collection["title"] ?? "")
                    let image = collection["image"] as? [String:Any]
                    print(image?["src"] ?? "")
                }
            }
        }
      task.resume()
    }
    
    
}
