//
//  shopifyMobileChallengeTests.swift
//  shopifyMobileChallengeTests
//
//  Created by Wiljay Flores on 2019-01-13.
//  Copyright © 2019 wiljay. All rights reserved.
//

import XCTest
@testable import shopifyMobileChallenge

class shopifyMobileChallengeTests: XCTestCase {
    

    override func setUp() {
        super.setUp()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCollectionAttributes() {
  
        
        let json: [String:Any] = ["id": 123456,
                                  "title": "Test collection",
                                  "body_html": "This is a test",
                                  "image": ["src":"https://cdn.shopify.com/s/files/1/1000/7970/collections/Aerodynamic_20Cotton_20Keyboard_grande_b213aa7f-9a10-4860-8618-76d5609f2c19.png?v=1545072718"]]
        
        let collection = Collection(json: json)
        
        XCTAssertEqual(collection.id, 123456)
        XCTAssertEqual(collection.name, "Test")
        XCTAssertEqual(collection.body, "This is a test")
        XCTAssertNotNil(collection.collectionImage)
        
    }
    
    func testProductAttributes() {
        
        let json: [String:Any] = ["id": 123456,
                                  "title": "Test Product",
                                  "image": ["src":"https://cdn.shopify.com/s/files/1/1000/7970/collections/Aerodynamic_20Cotton_20Keyboard_grande_b213aa7f-9a10-4860-8618-76d5609f2c19.png?v=1545072718"],
                                  "variants": [["title":"blue","inventory_quantity": 20],["title":"green","inventory_quantity":35]]]
        
        let product = Product(json: json)
        
        XCTAssertEqual(product.id, 123456)
        XCTAssertEqual(product.name, "Test Product")
        XCTAssertEqual(product.quantity, 55)
        XCTAssertNotNil(product.productImage)
        
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
