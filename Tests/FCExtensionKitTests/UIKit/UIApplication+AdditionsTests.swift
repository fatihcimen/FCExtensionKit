//
//  UIApplication+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 27.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import XCTest
import UIKit

class UIApplication_AdditionsTests: XCTestCase {
    
    func testIsDebug() {
        #if DEBUG
        XCTAssertTrue(UIApplication.isDebug)
        #else
        XCTAssertFalse(UIApplication.isDebug)
        #endif
    }
}
