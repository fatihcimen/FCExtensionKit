//
//  CodableEnumTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 12.08.2021.
//

import XCTest
@testable import FCExtensionKit

class CodableEnumTests: XCTestCase {
    
    enum LogType: String, CodableEnum {
        case info
        case error
        case unknown
    }
    
    enum Status: String, Codable {
        case success
        case failure
        case unknown
    }
    
    struct Logger: Codable {
        let type: LogType?
        let status: Status?
    }

    func testCodableEnum() {
        let data = Data("""
        {
          "type": "error"
        }
        """.utf8)
        
        let response = try? JSONDecoder().decode(Logger.self, from: data)
        
        XCTAssertEqual(response?.type, .error)
        XCTAssertNotEqual(response?.type, .unknown)
        XCTAssertNotEqual(response?.type, .info)
    }
    
    func testCodableEnumUnknown() {
        let data = Data("""
        {
          "type": "warning"
        
        }
        """.utf8)
        
        let response = try? JSONDecoder().decode(Logger.self, from: data)
        
        // Test Codable Enum
        XCTAssertEqual(response?.type, .unknown)
        XCTAssertNotEqual(response?.type, .info)
        XCTAssertNotEqual(response?.type, .error)
    }
    
    func testEnum() {
        let data = Data("""
        {
          "status": "failure"
        }
        """.utf8)
        
        let response = try? JSONDecoder().decode(Logger.self, from: data)
        
        // Test Enum
        XCTAssertEqual(response?.status, .failure)
        XCTAssertNotEqual(response?.status, .success)
        XCTAssertNotEqual(response?.status, .unknown)
    }
    
    func testEnumUnknown() {
        let data = Data("""
        {
          "status": "redirect"
        }
        """.utf8)
        
        let response = try? JSONDecoder().decode(Logger.self, from: data)
        
        // Test Enum
        XCTAssertNil(response)
        XCTAssertNotEqual(response?.status, .unknown)
        XCTAssertNotEqual(response?.status, .success)
        XCTAssertNotEqual(response?.status, .failure)
    }
}
