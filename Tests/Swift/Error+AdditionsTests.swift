//
//  Error+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 13.01.2020.
//  Copyright © 2020 Fatih Çimen. All rights reserved.
//

import XCTest
@testable import FCExtensionKit

class Error_AdditionsTests: XCTestCase {

    // MARK: - Properties
    private var error: Error? = NSError(domain: "Test", code: 1, userInfo: nil)
    
    // MARK: - Tests
    func testErrorCode() {
        XCTAssertEqual(error?.code, 1)
    }
    
    func testErrorDomain() {
        XCTAssertEqual(error?.domain, "Test")
    }

}


