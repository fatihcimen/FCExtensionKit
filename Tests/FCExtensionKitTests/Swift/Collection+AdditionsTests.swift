//
//  Collection+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 13.01.2020.
//  Copyright © 2020 Fatih Çimen. All rights reserved.
//

import XCTest

class Collection_AdditionsTests: XCTestCase {
    
    // MARK: - Properties
    private let collection = [1, 2, 3, 4, 5]

    // MARK: - Tests
    func testSubscriptIndex() {
        XCTAssertNotNil(collection[index: 4])
        XCTAssertNil(collection[index: 5])
        XCTAssertEqual(collection[index: 1], 2)
    }
}
