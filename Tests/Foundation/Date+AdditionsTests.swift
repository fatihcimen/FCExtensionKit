//
//  Date+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 29.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import XCTest

class Date_AdditionsTests: XCTestCase {

    func testTimePassedUntilNow() {
        let date = Calendar.current.date(byAdding: .hour, value: -1, to: Date())
        let hour = Int((date?.timePassedUntilNow ?? 0) / 3600)
        
        XCTAssertEqual(hour, 1)
    }
}
