//
//  NSMutableAttributedString+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 29.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import XCTest

class NSAttributedString_AdditionsTests: XCTestCase {
    
    // MARK: - Constants
    private enum Constant {
        enum Texts {
            static let title: String = "300,07 TL x 12 ay’a varan taksit seçenekleri"
        }
        
        enum Fonts {
            static let font: UIFont = .systemFont(ofSize: 19, weight: .bold)
        }
        
        enum Kerns {
            static let kern: CGFloat = 0
        }
        
        enum Colors {
            static let yellow: UIColor = .yellow
        }
    }
    
    // MARK: - Properties
    var attributedString: NSMutableAttributedString?
    var testAttributedString: NSMutableAttributedString?
    var attributeString: String?

    // MARK: - Life cycle
    override func setUp() {
        attributedString = NSMutableAttributedString(string: Constant.Texts.title)
        testAttributedString = attributedString
        attributeString = getRandomText()
    }
    
    override func tearDown() {
        attributedString = nil
    }
    
    // MARK: - Tests
    func testSetColor() {
        guard let attributeString = attributeString, let range = attributedString?.mutableString.range(of: attributeString, options: .caseInsensitive) else { return }
        
        attributedString?.addAttribute(.foregroundColor, value: Constant.Colors.yellow, range: range)
        
        testAttributedString?.setColor(for: attributeString, with: Constant.Colors.yellow)
        
        XCTAssertEqual(attributedString, testAttributedString)
    }
    
    func testSetFont() {
        guard let attributeString = attributeString, let range = attributedString?.mutableString.range(of: attributeString, options: .caseInsensitive) else { return }
        
        attributedString?.addAttributes([
            .font: Constant.Fonts.font,
            .kern: Constant.Kerns.kern], range: range)
        
        testAttributedString?.setFont(for: attributeString, with: Constant.Fonts.font)
        
        XCTAssertEqual(attributedString, testAttributedString)
    }
    
    func testSetAttributes() {
        guard let attributeString = attributeString, let range = attributedString?.mutableString.range(of: attributeString, options: .caseInsensitive) else { return }
        
        attributedString?.addAttributes([
            .font: Constant.Fonts.font,
            .kern: Constant.Kerns.kern], range: range)
        
        testAttributedString?.setAttributes(for: attributeString, attributes: [.font : Constant.Fonts.font,
                                                                               .kern : Constant.Kerns.kern])
        
        XCTAssertEqual(attributedString, testAttributedString)
    }
    
    // MARK: - Helpers
    private func getRandomText() -> String? {
        let texts = Constant.Texts.title.components(separatedBy: " ")
        return texts.randomElement()
    }
}
