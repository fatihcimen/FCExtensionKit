//
//  Bool+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 13.01.2020.
//  Copyright © 2020 Fatih Çimen. All rights reserved.
//

import XCTest

class Bool_AdditionsTests: XCTestCase {
    
    // MARK: - Properties
    private var isTrue = true
    
    // MARK: - Initializers
    override func setUp() {
        isTrue = true
    }

    // MARK: - Tests
    func testIsToggled() {
        isTrue.toggle()
        XCTAssertTrue(isTrue.isToggled())
    }
    
    func testIsToggledFalse() {
        XCTAssertFalse(isTrue.isToggled())
    }

}
