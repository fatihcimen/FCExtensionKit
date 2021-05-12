//
//  String+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 13.01.2020.
//  Copyright © 2020 Fatih Çimen. All rights reserved.
//

import XCTest

class String_AdditionsTests: XCTestCase {
    
    // MARK: - Tests
    func testReaminingTime() {
        var date = Date()
        date.addTimeInterval(60)
        let formatter = DateFormatter()
        var dateString = formatter.string(from: date)
        
        XCTAssertNil(dateString.remainingTime)
        
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateString = formatter.string(from: date)
        
        XCTAssertEqual(dateString.remainingTime, "0:0:59")
        
        date.addTimeInterval(86341)
        dateString = formatter.string(from: date)
        XCTAssertEqual(dateString.remainingTime, "1 Gün 0:0:0")
    }
    
    func testDate() {
        let date = Date(timeIntervalSinceReferenceDate: -31622400.0)
        
        let dateString = "2000-01-01T00:00:00.000Z"
        
        XCTAssertEqual(dateString.date(format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ"), date)
    }
    
    func testLength() {
        let string = "Test"
        
        XCTAssertEqual(string.length, string.count)
    }
    
    func testTrimmed() {
        let string = "  \t\t  Trimmed Test  \n \t  \n     "
        let trimmedString = "Trimmed Test"
        
        XCTAssertEqual(string.trimmed, trimmedString)
    }
    
    func testTrimmedLeadingAndLeading() {
        let string = "  TrimmedLeading And Leading Test     "
        let trimmedString = "TrimmedLeading And Leading Test"
        
        XCTAssertEqual(string.trimmedLeadingAndLeading, trimmedString)
    }
    
    func testNS() {
        let string = "TEST"
        let nsString = NSString(string: "TEST")
        
        XCTAssertEqual(string.ns, nsString)
    }
    
    func testFloatValue() {
        let float: Float = 0.5
        let floatString = "0.5"
        
        XCTAssertEqual(floatString.floatValue, float)
    }
    
    func testIntegerValue() {
        let integer = 3
        let integerString = "3"
        
        XCTAssertEqual(integer, integerString.integerValue)
    }
    
    func testIsNotEmpty() {
        let string = "Test String"
        
        XCTAssertTrue(string.isNotEmpty)
    }
    
    func testToDouble() {
        let double = 0.5
        let doubleString = "0,5"
        
        XCTAssertEqual(double, doubleString.toDouble)
    }
    
    func testToDoubleFail() {
        let string = "fail"
        
        XCTAssertEqual(string.toDouble, 0.0)
    }
    
    func testSha1() {
        // https://en.wikipedia.org/wiki/SHA-1#Example_hashes
        let lazyDog = "The quick brown fox jumps over the lazy dog"
        
        XCTAssertEqual(lazyDog.sha1, "2fd4e1c67a2d28fced849ee1bb76e7391b93eb12")
    }
    
    func testHtml2AttributedString() {
        let attributedString = NSAttributedString(string: "Hello World", attributes: [
                                                                                        .font: UIFont(name: "TimesNewRomanPS-BoldMT", size: 12) as Any,
                                                                                        .kern: 0])
        
        let range = NSRange(location: 0, length: attributedString.length)
        
        let html2AttributedString = "<b>Hello World</b>".html2AttributedString
        html2AttributedString?.removeAttribute(.paragraphStyle, range: range)
        html2AttributedString?.removeAttribute(.strokeColor, range: range)
        html2AttributedString?.removeAttribute(.strokeWidth, range: range)
        html2AttributedString?.removeAttribute(.foregroundColor, range: range)
        
        XCTAssertEqual(attributedString, html2AttributedString)
    }
    
    func testUrl() {
        let urlString = "https://hepsiburada.com"
        let url = URL(string: "https://hepsiburada.com")
        
        XCTAssertEqual(urlString.url, url)
    }
    
    func testUrlCharacterSet() {
        let urlString = "https://hepsiburada.com/Hepsi Burada"
        let url = URL(string: "https://hepsiburada.com/Hepsi%20Burada")
        
        XCTAssertEqual(urlString.url, url)
    }
    
    func testUrlEncode() {
        let urlString = "https://hepsiburada.com/Hepsi Burada"
        let url = URL(string: "https%3A%2F%2Fhepsiburada.com%2FHepsi%20Burada")
        
        XCTAssertEqual(urlString.urlEncoded, url?.absoluteString)
    }
    
    func testUrlDecode() {
        let urlString = "https://hepsiburada.com/Hepsi+Burada"
        let decodedString = "https://hepsiburada.com/Hepsi Burada"
        
        XCTAssertEqual(urlString.urlDecoded, decodedString)
    }
    
    func testInitWithChar() {
        let emptyString = ""
        let emptyCharString = String(emptyString.first)
        
        XCTAssertNil(emptyCharString)
        
        let string = "Hepsiburada"
        let charString = String(string.first)
        
        XCTAssertEqual(charString?.first, "H")
    }
    
    func testHetLabelHeight() {
        let string = "Test String"
        
        let height = string.getLabelHeight(width: 100, font: .systemFont(ofSize: 20))
        
        XCTAssertEqual(height, 24)
    }
}
