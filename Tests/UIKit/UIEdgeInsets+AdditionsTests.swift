//
//  UIEdgeInsets+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 5.12.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import XCTest

class UIEdgeInsets_AdditionsTests: XCTestCase {
    
    // MARK: - Constants
    private enum Constant {
        static let edges: CGFloat = 23
        static let horizintal: CGFloat = 12
        static let vertical: CGFloat = 192
    }
    
    // MARK: - Tests
    func testInitWithHorVer() {
        let edgeInsets = UIEdgeInsets(top: Constant.vertical, left: Constant.horizintal, bottom: Constant.vertical, right: Constant.horizintal)
        
        let extEdgeInsets = UIEdgeInsets(horizontal: Constant.horizintal, vertical: Constant.vertical)
        
        XCTAssertEqual(edgeInsets, extEdgeInsets)
    }
    
    func testInitWithEdges() {
        let edgeInsets = UIEdgeInsets(top: Constant.edges, left: Constant.edges, bottom: Constant.edges, right: Constant.edges)
        
        let extEdgeInsets = UIEdgeInsets(edges: Constant.edges)
        
        XCTAssertEqual(edgeInsets, extEdgeInsets)
    }
    
    func testNegated() {
        let edgeInsets = UIEdgeInsets(edges: Constant.edges).negated
        
        let edgeInsetsNegate = UIEdgeInsets(edges: -Constant.edges)
        
        XCTAssertEqual(edgeInsets, edgeInsetsNegate)
    }
    
    func testNegate() {
        var edgeInsets = UIEdgeInsets(edges: Constant.edges)
        edgeInsets.negate()
        
        let edgeInsetsNegate = UIEdgeInsets(edges: -Constant.edges)
        
        XCTAssertEqual(edgeInsets, edgeInsetsNegate)
    }
}
