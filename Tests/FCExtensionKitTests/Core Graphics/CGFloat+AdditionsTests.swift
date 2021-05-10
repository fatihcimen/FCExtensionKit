//
//  CGFloat+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 5.12.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import XCTest

class CGFloat_AdditionsTests: XCTestCase {

    func testCGFloatMaxValue() {
        XCTAssertEqual(CGFloat.max, .greatestFiniteMagnitude)
    }
    
    func testCGFloatMinValue() {
        XCTAssertEqual(CGFloat.min, .leastNormalMagnitude)
    }
}
