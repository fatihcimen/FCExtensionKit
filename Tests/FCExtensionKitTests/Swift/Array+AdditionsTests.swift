//
//  Array+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 13.01.2020.
//  Copyright © 2020 Fatih Çimen. All rights reserved.
//

import XCTest

class Array_AdditionsTests: XCTestCase {

    // MARK: - Properties
    var array: [Int]?

    // MARK: - Initializers
    override func setUp() {
        array = [1, 2, 3, 4, 5]
    }

    // MARK: - Tests
    func testGet() {
        XCTAssertEqual(array?.get(0), 1)
        XCTAssertNil(array?.get(-1))
    }
    
    func testRemove() {
        array?.remove(element: 1)
        
        XCTAssertEqual(array?.count, 4)
        XCTAssertNotEqual(array?.get(0), 1)
        XCTAssertFalse(array?.contains(1) ?? true)
    }
    
    func testIncrement() {
        array?.increment(at: 0)
        array?.increment(at: 1, by: 3)
        
        XCTAssertEqual(array?.get(0), 2)
        XCTAssertEqual(array?.get(1), 5)
    }
    
    func testIncrementFalse() {
        array?.increment(at: -1)
        
        XCTAssertNil(array?.get(-1))
    }
    
    func testDecrement() {
        array?.decrement(at: 0)
        array?.decrement(at: 1, by: 3)
        
        XCTAssertEqual(array?.get(0), 0)
        XCTAssertEqual(array?.get(1), -1)
    }
    
    func testDecrementFalse() {
        array?.decrement(at: -1)
        
        XCTAssertNil(array?.get(-1))
    }
    
    func testJoined() {
        let attributedString = NSAttributedString(string: "a")
        let attributedString2 = NSAttributedString(string: "a2")
        
        let stringArray = [attributedString, attributedString2]
        
        let seperator = NSAttributedString(string: "/")
        
        let joinedArray = stringArray.joined(separator: seperator)
        
        let joinedString = NSAttributedString(string: "a/a2")
        
        XCTAssertEqual(joinedArray, joinedString)
    }
    
    func testPairs() {
        let pairsArray = ["a", "a", "b", "b", "c"]
        pairsArray.pairs.enumerated().forEach({ index, pairs in
            let (lhs, rhs) = pairs
            
            if index != 2 {
                XCTAssertEqual(lhs, rhs)
            }else {
                XCTAssertNotEqual(lhs, rhs)
            }
        })
    }
    
    func testIsNotEmpty() {
        XCTAssertTrue(array?.isNotEmpty ?? false)
    }
    
    func testIsNotEmptyFalse() {
        array?.removeAll()
        XCTAssertFalse(array?.isNotEmpty ?? true)
    }

}
