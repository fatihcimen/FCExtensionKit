//
//  UIView+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 12.02.2020.
//  Copyright © 2020 Fatih Çimen. All rights reserved.
//

import XCTest
import UIKit

class UIView_AdditionsTests: XCTestCase {
    
    // MARK: - Constants
    private enum Constant {
        static let rect: CGRect = CGRect(x: 0, y: 0, width: 10, height: 10)
        static let orginalWidth: CGFloat = 10
        static let orginalHeight: CGFloat = 10
        static let replacedSize: CGSize = CGSize(width: 64, height: 88)
        static let replacedWidth: CGFloat = 21
        static let replacedHeight: CGFloat = 92
        static let replacedCenterX: CGFloat = 6
        static let replacedCenterY: CGFloat = 291
        static let replacedLeft: CGFloat = 512
        static let replacedTop: CGFloat = 123
        static let replacedRight: CGFloat = 462
        static let replacedBottom: CGFloat = 328
        static let replacedPosition: CGPoint = CGPoint(x: 73, y: 321)
        static let replacedX: CGFloat = 94
        static let replacedY: CGFloat = 97
    }
    
    // MARK: - Private Properties
    private var view: UIView?
    
    // MARK: - Life cycle
    override func setUp() {
        super.setUp()
        
        self.view = UIView(frame: Constant.rect)
    }
    
    override func tearDown() {
        super.tearDown()
        
        self.view = nil
    }
    
    // MARK: - Tests
    func testWidth() {
        XCTAssertEqual(view?.width, view?.frame.width)
        
        view?.width = Constant.replacedWidth
        
        XCTAssertEqual(view?.width, Constant.replacedWidth)
        XCTAssertEqual(view?.width, view?.frame.width)
    }
    
    func testHeight() {
        XCTAssertEqual(view?.height, view?.frame.height)
        
        view?.height = Constant.replacedHeight
        
        XCTAssertEqual(view?.height, Constant.replacedHeight)
        XCTAssertEqual(view?.height, view?.frame.height)
    }
    
    func testSize() {
        XCTAssertEqual(view?.size, view?.frame.size)
        
        view?.size = Constant.replacedSize
        
        XCTAssertEqual(view?.size, Constant.replacedSize)
        XCTAssertEqual(view?.size, view?.frame.size)
    }
    
    func testCenterX() {
        XCTAssertEqual(view?.centerX, view?.center.x)
        
        view?.centerX = Constant.replacedCenterX
        
        XCTAssertEqual(view?.centerX, Constant.replacedCenterX)
        XCTAssertEqual(view?.centerX, view?.center.x)
    }
    
    func testCenterY() {
        XCTAssertEqual(view?.centerY, view?.center.y)
        
        view?.centerY = Constant.replacedCenterY
        
        XCTAssertEqual(view?.centerY, Constant.replacedCenterY)
        XCTAssertEqual(view?.centerY, view?.center.y)
    }
    
    func testLeft() {
        XCTAssertEqual(view?.left, view?.frame.minX)
        XCTAssertEqual(view?.left, view?.frame.origin.x)
        
        view?.left = Constant.replacedLeft
        
        XCTAssertEqual(view?.left, Constant.replacedLeft)
        XCTAssertEqual(view?.left, view?.frame.minX)
        XCTAssertEqual(view?.left, view?.frame.origin.x)
    }
    
    func testTop() {
        XCTAssertEqual(view?.top, view?.frame.minY)
        XCTAssertEqual(view?.top, view?.frame.origin.y)
        
        view?.top = Constant.replacedTop
        
        XCTAssertEqual(view?.top, Constant.replacedTop)
        XCTAssertEqual(view?.top, view?.frame.minY)
        XCTAssertEqual(view?.top, view?.frame.origin.y)
    }
    
    func testRight() {
        XCTAssertEqual(view?.right, view?.frame.maxX)
        
        view?.right = Constant.replacedRight
        
        XCTAssertEqual(view?.right, Constant.replacedRight)
        XCTAssertEqual(view?.right, view?.frame.maxX)
    }
    
    func testBottom() {
        XCTAssertEqual(view?.bottom, view?.frame.maxY)
        
        view?.bottom = Constant.replacedBottom
        
        XCTAssertEqual(view?.bottom, Constant.replacedBottom)
        XCTAssertEqual(view?.bottom, view?.frame.maxY)
    }
    
    func testPosition() {
        XCTAssertEqual(view?.position, view?.frame.origin)
        
        view?.position = Constant.replacedPosition
        
        XCTAssertEqual(view?.position, Constant.replacedPosition)
        XCTAssertEqual(view?.position, view?.frame.origin)
    }
    
    func testX() {
        XCTAssertEqual(view?.x, view?.frame.origin.x)
        
        view?.x = Constant.replacedX
        
        XCTAssertEqual(view?.x, Constant.replacedX)
        XCTAssertEqual(view?.x, view?.frame.origin.x)
    }
    
    func testY() {
        XCTAssertEqual(view?.y, view?.frame.origin.y)
        
        view?.x = Constant.replacedY
        
        XCTAssertEqual(view?.x, Constant.replacedY)
        XCTAssertEqual(view?.x, view?.frame.origin.x)
    }
}
