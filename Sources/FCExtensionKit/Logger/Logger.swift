//
//  URLConvertible.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 10.05.2021.
//  Copyright © 2021 Fatih Çimen. All rights reserved.
//

import Foundation

public enum LogType {
    case infoLog
    case defaultLog
    case debugLog
    case errorLog
    case faultLog
    
    var type: String {
        switch self {
        case .infoLog:
            return "🟡 INFO"
        case .debugLog:
            return "🔵 DEBUG"
        case .errorLog:
            return "🔴 ERROR"
        case .defaultLog:
            return "🟢 DEFAULT"
        case .faultLog:
            return "⚪️ FAULT"
        }
    }
}

public class Logger {
    
    public static let shared: Logger = Logger()
    
    public func log(_ logType: LogType = .infoLog,
                    message: String = .empty,
                    line: Int = #line,
                    function: String = #function,
                    file: String = #file) {
        #if DEBUG
        print("[\(logType.type)], message: \(message), line: \(line), function: \(function), file: \(file)")
        #endif
    }
}
