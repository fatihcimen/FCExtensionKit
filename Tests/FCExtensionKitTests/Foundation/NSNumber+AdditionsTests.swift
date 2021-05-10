//
//  NSNumber+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 29.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import XCTest

class NSNumber_AdditionsTests: XCTestCase {
    func testCGFloatValue() {
        let nsNumber: NSNumber = 2
        let cgFloat: CGFloat = 2
        
        XCTAssertEqual(nsNumber.cgFloatValue, cgFloat)
    }
}
