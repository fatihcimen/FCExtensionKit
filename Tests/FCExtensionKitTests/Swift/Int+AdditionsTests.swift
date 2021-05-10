//
//  Int+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 13.01.2020.
//  Copyright © 2020 Fatih Çimen. All rights reserved.
//

import XCTest

class Int_AdditionsTests: XCTestCase {

    // MARK: - Properties
    private var value: Int?
    
    // MARK: - Initializers
    override func tearDown() {
        value = nil
    }
    
    // MARK: - Tests
    func testIsPositive() {
        value = 1
        
        XCTAssertTrue(value?.isPositive ?? false)
    }
    
    func testIsPositiveFalse() {
        value = -1
        
        XCTAssertFalse(value?.isPositive ?? true)
    }
    
    func testIsNegative() {
        value = -1
        
        XCTAssertTrue(value?.isNegative ?? false)
    }
    
    func testIsNegativeFalse() {
        value = 1
        
        XCTAssertFalse(value?.isNegative ?? true)
    }
    
    func testStringValue() {
        value = 12
        
        XCTAssertEqual(value?.stringValue, "12")
    }

}
