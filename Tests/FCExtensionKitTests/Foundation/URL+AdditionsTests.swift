//
//  URL+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 27.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

@testable import FCExtensionKit
import XCTest

class URL_AdditionsTests: XCTestCase {
    
    // MARK: - Constants
    private enum Constant {
        enum URLs {
            static let httpHepsiburada: URL? = URL(string: "http://hepsiburada.com/")
            static let httpsWwwHepsiburada: URL? = URL(string: "https://www.hepsiburada.com/")
            static let httpsHepsiburada: URL? = URL(string:"https://hepsiburada.com/")
            static let hepsiburadaWithParameter: URL? = URL(string:"http://hepsiburada.com/?test=parameter")
            static let blob: URL? = URL(string:"blob:https://hepsiburada.com/")
            static let hepsiburada: URL? = URL(string: "hepsiburada.com")
            static let unknownSchemeType: URL? = URL(string: "test://hepsiburada.com/")
            static let unknownHostType: URL? = URL(string: "https://google.com/")
            static let none: URL? = URL(string: "https://")
            static let data: URL? = URL(string: "data:hepsiburada/data")
            static let about: URL? = URL(string: "about:hepsiburada/about")
        }
        
        enum SearchEngineURLs {
            static let bing: URL? = URL(string: "http://bing.com/")
            static let google: URL? = URL(string: "https://google.com/")
            static let yaani: URL? = URL(string:"https://yaani.com/")
            static let yahoo: URL? = URL(string:"https://yahoo.com/")
            static let yandex: URL? = URL(string:"https://yandex.com/")
        }
    }
    
    // MARK: - Tests
    func testURLAndString() {
        XCTAssertEqual(Constant.URLs.httpHepsiburada?.urlString, Constant.URLs.httpHepsiburada?.absoluteString)
    }
    
    func testUrl() {
        XCTAssertEqual(Constant.URLs.httpHepsiburada, Constant.URLs.httpHepsiburada?.url)
    }
    
    func testAppendingQueryParameters() {
        let appendedUrl = Constant.URLs.httpHepsiburada?.appendingQueryParameters(["test": "parameter"])
        
        XCTAssertEqual(appendedUrl, Constant.URLs.hepsiburadaWithParameter)
    }
    
    func testURLScheme() {
        // Test Https
        XCTAssertEqual(Constant.URLs.httpsHepsiburada?.schemeType, .https)
        
        // Test Http
        XCTAssertEqual(Constant.URLs.httpHepsiburada?.schemeType, .http)
        
        // Test Blob
        XCTAssertEqual(Constant.URLs.blob?.schemeType, .blob)
        
        // Test None
        XCTAssertEqual(Constant.URLs.hepsiburada?.schemeType, URLSchemeType.none)
        
        // Test unknown
        XCTAssertEqual(Constant.URLs.unknownSchemeType?.schemeType, .unknown)
    }
    
    func testAnyHTTP() {
        XCTAssertTrue(Constant.URLs.httpHepsiburada?.isAnyHTTP ?? false)
        XCTAssertFalse(Constant.URLs.unknownSchemeType?.isAnyHTTP ?? true)
    }
    
    func testInitSearchEngine() {
        let emptySearchEngine = URL.SearchEngine(with: Constant.URLs.none!)
        XCTAssertNil(emptySearchEngine)
        
        let bingSearchEngine = URL.SearchEngine(with: Constant.SearchEngineURLs.bing!)
        XCTAssertEqual(bingSearchEngine, URL.SearchEngine.bing)
        
        let googleSearchEngine = URL.SearchEngine(with: Constant.SearchEngineURLs.google!)
        XCTAssertEqual(googleSearchEngine, URL.SearchEngine.google)
        
        let yaaniSearchEngine = URL.SearchEngine(with: Constant.SearchEngineURLs.yaani!)
        XCTAssertEqual(yaaniSearchEngine, URL.SearchEngine.yaani)
        
        let yahooSearchEngine = URL.SearchEngine(with: Constant.SearchEngineURLs.yahoo!)
        XCTAssertEqual(yahooSearchEngine, URL.SearchEngine.yahoo)
        
        let yandexSearchEngine = URL.SearchEngine(with: Constant.SearchEngineURLs.yandex!)
        XCTAssertEqual(yandexSearchEngine, URL.SearchEngine.yandex)
        
        let unknownSearchEngine = URL.SearchEngine(rawValue: "https://hepsiburada.com")
        XCTAssertNil(unknownSearchEngine)
    }
    
    func testSearchEngine() {
        let googleSearchEngine = Constant.SearchEngineURLs.google?.searchEngine
        XCTAssertEqual(googleSearchEngine, URL.SearchEngine.google)
        
        let unknownSearchEngine = Constant.URLs.hepsiburada?.searchEngine
        XCTAssertNil(unknownSearchEngine)
    }
    
    func testIsSearchEngine() {
        XCTAssertTrue(Constant.SearchEngineURLs.google?.isSearchEngine ?? false)
        XCTAssertFalse(Constant.URLs.hepsiburada?.isSearchEngine ?? true)
    }
}
