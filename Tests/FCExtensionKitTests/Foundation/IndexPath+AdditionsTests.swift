//
//  IndexPath+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 29.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import XCTest

class IndexPath_AdditionsTests: XCTestCase {
    
    var indexPath: IndexPath?
    
    override func tearDown() {
        indexPath = nil
    }

    func testIsFirstRow() {
        indexPath = IndexPath(item: 0, section: 0)
        
        XCTAssertTrue(indexPath?.isFirstRow ?? false)
    }
    
    func testIsFirstRowFalse() {
        indexPath = IndexPath(item: 1, section: 0)
        
        XCTAssertFalse(indexPath?.isFirstRow ?? true)
    }
    
    func testIsFirstRowFirstSection() {
        indexPath = IndexPath(item: 0, section: 1)
        
        XCTAssertTrue(indexPath?.isFirstRow ?? false)
    }
    
    func testIsFirstRowFirstSectionFalse() {
        indexPath = IndexPath(item: 1, section: 1)
        
        XCTAssertFalse(indexPath?.isFirstRow ?? true)
    }
}
