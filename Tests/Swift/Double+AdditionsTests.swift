//
//  Double+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 13.01.2020.
//  Copyright © 2020 Fatih Çimen. All rights reserved.
//

import XCTest

class Double_AdditionsTests: XCTestCase {
    
    // MARK: - Properties
    private var doubleValue: Double?
    
    // MARK: - Initializers
    override func tearDown() {
        doubleValue = nil
    }

    // MARK: - Tests
    func testFormattedPercentage() {
        doubleValue = 25
        
        XCTAssertEqual(doubleValue?.formattedPercentage, "%25")
    }
    
    func testFormattedPrice() {
        doubleValue = 23.6

        XCTAssertEqual(doubleValue?.formattedPrice, "23,60")
    }
    
    func testPriceToString() {
        doubleValue = 36.1
        
        XCTAssertEqual(doubleValue?.priceToString(with: nil), "36,10")
        XCTAssertEqual(doubleValue?.priceToString(with: "TL"), "36,10 TL")
    }
    
    func testTimeConversions() {
        doubleValue = 1
        
        // Millisecond
        XCTAssertEqual(doubleValue?.millisecond, 0.001)
        
        // Second
        XCTAssertEqual(doubleValue?.second, 1)
        
        // Minute
        XCTAssertEqual(doubleValue?.minute, 60)
        
        // Hour
        XCTAssertEqual(doubleValue?.hour, 3600)
        
        // Day
        XCTAssertEqual(doubleValue?.day, 86400)
    }
}
