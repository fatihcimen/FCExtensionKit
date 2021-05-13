//
//  URLConvertibleTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 27.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

@testable import FCExtensionKit
import XCTest

class URLConvertibleTests: XCTestCase {
    
    // MARK: - Constants
    private enum Constant {
        enum Urls {
            static let url = URL(string: "http://www.hepsiburada.com/test?parameter=q+v")
        }
    }
    
    // MARK: - Properties
    private var urlConvertible: URLConvertible?

    // MARK: - Life cycle
    override func setUp() {
        urlConvertible = Constant.Urls.url
    }

    // MARK: - Tests
    func testQueryItems() {
        XCTAssertEqual(urlConvertible?.queryItems?.count, 1)
        XCTAssertEqual(urlConvertible?.queryItems?.first?.value, "q v")
    }
    
    func testQueryParameters() {
        XCTAssertEqual(urlConvertible?.queryParameters["parameter"], "q v")
    }
}
