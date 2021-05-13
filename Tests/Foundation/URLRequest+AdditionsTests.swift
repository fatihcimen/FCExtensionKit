//
//  URLRequest+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 29.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import XCTest

class URLRequest_AdditionsTests: XCTestCase {
    
    // MARK: - Constants
    private enum Constant {
        enum URLs {
            static let hepsiburada: URL! = URL(string: "https://hepsiburada.com/")
        }
    }
    
    // MARK: - Properties
    private var urlRequest: URLRequest?
    private var queryItem: URLQueryItem?
    
    // MARK: - Life cycle
    override func setUp() {
        queryItem = URLQueryItem(name: "Name", value: "Value")
    }
    
    override func tearDown() {        
        urlRequest = nil
    }
    
    // MARK: - Tests
    func testAppendQueryItem() {
        let url = Constant.URLs.hepsiburada.appendingQueryParameters(["Name": "Value"])
        
        urlRequest = URLRequest(url: Constant.URLs.hepsiburada)
        urlRequest?.append(queryItem: queryItem!)
        
        XCTAssertEqual(url, urlRequest?.url)
        XCTAssertNotNil(urlRequest?.url?.queryItems)
    }
    
    func testAppendQueryItemNil() {
        urlRequest = URLRequest(url: Constant.URLs.hepsiburada)
        urlRequest?.url = nil
        urlRequest?.append(queryItem: queryItem!)
        
        XCTAssertNil(urlRequest?.url?.queryItems)
    }

}
