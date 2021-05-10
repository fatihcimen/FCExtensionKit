//
//  CGSize+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 5.12.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import XCTest

class CGSize_AdditionsTests: XCTestCase {
    
    // MARK: - Constants
    private enum Constant {
        enum Size {
            static let size: CGFloat = 10
            static let width: CGFloat = 15.23
            static let height: CGFloat = 30.23
        }
    }
    
    // MARK: - Properties
    private var cgSize: CGSize?

    // MARK: - Tests
    func testInit() {
        cgSize = CGSize(size: Constant.Size.size)
        let size = CGSize(width: Constant.Size.size, height: Constant.Size.size)
        
        XCTAssertEqual(cgSize, size)
    }
    
    func testMaxSize() {
        let size = CGSize.max
        
        XCTAssertEqual(size.width, .greatestFiniteMagnitude)
        XCTAssertEqual(size.height, .greatestFiniteMagnitude)
    }
    
    func testCeiled() {
        cgSize = CGSize(width: Constant.Size.width, height: Constant.Size.height).ceiled
        
        XCTAssertEqual(cgSize?.width, ceil(Constant.Size.width))
        XCTAssertEqual(cgSize?.height, ceil(Constant.Size.height))
    }
    
    func testFloored() {
        cgSize = CGSize(width: Constant.Size.width, height: Constant.Size.height).floored
        
        XCTAssertEqual(cgSize?.width, floor(Constant.Size.width))
        XCTAssertEqual(cgSize?.height, floor(Constant.Size.height))
    }
    
    func testToRect() {
        cgSize = CGSize(width: Constant.Size.width, height: Constant.Size.height)
        let rect = cgSize?.toRect
        
        XCTAssertEqual(rect?.origin, .zero)
        XCTAssertEqual(rect?.size.width, Constant.Size.width)
        XCTAssertEqual(rect?.size.height, Constant.Size.height)
    }

}
