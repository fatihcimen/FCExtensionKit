//
//  NSString+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 27.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import XCTest

class NSString_AdditionsTests: XCTestCase {
    
    // MARK: - Constants
    private enum Constant {
        enum Texts {
            static let title: NSString = "300,07 TL x 12 ay’a varan taksit seçenekleri"
        }
        
        enum Fonts {
            static let activeFont1: UIFont = .systemFont(ofSize: 10, weight: .regular)
            static let replaceFont1: UIFont = UIFont(name: "Times New Roman", size: 13) ?? .systemFont(ofSize: 13, weight: .regular)
        }
        
        enum Colors {
            static let yellow: UIColor = .yellow
        }
    }
    
    // MARK: - Properties
    private var regularString: NSMutableAttributedString {
        return NSMutableAttributedString(
            string: Constant.Texts.title as String,
            attributes: [
                .font: Constant.Fonts.activeFont1,
                .foregroundColor: Constant.Colors.yellow
            ]
        )
    }
    
    // MARK: - Tests
    func testSetFonts() {
        let formattedString = Constant.Texts.title.setFonts([Constant.Fonts.replaceFont1: Constant.Fonts.activeFont1],
                                                           textColor: .yellow)
        
        let formattedTextAttributes = formattedString?.attributes(at: 0, effectiveRange: nil)
        let regularStringAttributes = regularString.attributes(at: 0, effectiveRange: nil)
        
        XCTAssertEqual(formattedTextAttributes?[.font].debugDescription, regularStringAttributes[.font].debugDescription)
        XCTAssertEqual(formattedTextAttributes?[.foregroundColor].debugDescription, regularStringAttributes[.foregroundColor].debugDescription)
    }
}
