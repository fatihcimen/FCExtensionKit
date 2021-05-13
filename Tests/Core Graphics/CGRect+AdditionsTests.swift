//
//  CGRect+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 5.12.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import XCTest

class CGRect_AdditionsTests: XCTestCase {

    // MARK: - Constants
    private enum Constant {
        enum Coordinate {
            static let x: CGFloat = 5
            static let y: CGFloat = 3
        }
        
        enum Size {
            static let width: CGFloat = 24
            static let height: CGFloat = 82
        }
    }
    
    // MARK: - Properties
    private var rect: CGRect?
    private var size: CGSize?
    private var point: CGPoint?
    
    // MARK: - Life cycle
    override func setUp() {
        size = CGSize(width: Constant.Size.width, height: Constant.Size.height)
        point = CGPoint(x: Constant.Coordinate.x, y: Constant.Coordinate.y)
        
        rect = CGRect(origin: point!, size: size!)
    }
    
    // MARK: - Tests
    func testInitWithCoordinatesAndSize() {
        let extRect = CGRect(x: Constant.Coordinate.x, y: Constant.Coordinate.y, size: size!)
        
        XCTAssertEqual(rect, extRect)
    }
    
    func testInitWithPointAndSize() {
        let extRect = CGRect(origin: point!, width: Constant.Size.width, height: Constant.Size.height)
        
        XCTAssertEqual(rect, extRect)
    }

}
