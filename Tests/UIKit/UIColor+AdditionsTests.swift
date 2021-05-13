//
//  UIColor+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 5.12.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import XCTest

class UIColor_AdditionsTests: XCTestCase {
    
    func testInitWithHex() {
        let colorWithHex: UIColor = UIColor(hex: "#2A4CD2")
        let color: UIColor = #colorLiteral(red: 0.1647058824, green: 0.2980392157, blue: 0.8235294118, alpha: 1)
        
        XCTAssertTrue(compareColors(firstColor: colorWithHex, secondColor: color))
    }
    
    func testRandom() {
        var firstColorsSet = [UIColor]()
        var secondColorsSet = [UIColor]()
        
        for _ in 0...5 {
            firstColorsSet.append(.random)
            secondColorsSet.append(.random)
        }
        
        XCTAssertNotEqual(firstColorsSet, secondColorsSet)
    }
    
    func testIsDarkColor() {
        let firstColor: UIColor = .yellow
        let secondColor: UIColor = #colorLiteral(red: 0.1647058824, green: 0.2980392157, blue: 0.8235294118, alpha: 1)
    
        XCTAssertFalse(firstColor.isDarkColor)
        XCTAssertTrue(secondColor.isDarkColor)
    }
}
