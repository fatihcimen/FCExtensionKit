//
//  URLConvertible.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 22.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import Foundation

public protocol URLConvertible {
    var url: URL? { get }
    var urlString: String { get }
    var queryParameters: [String: String] { get }
}

public extension URLConvertible {
    
    var queryItems: [URLQueryItem]? {
        var components = URLComponents(string: urlString)
        let copied = components
        components?.percentEncodedQuery = copied?.percentEncodedQuery?.replacingOccurrences(
            of: "+", with: "%20")
        return components?.queryItems
    }
    
    var queryParameters: [String: String] {
        var parameters = [String: String]()
        queryItems?.forEach { queryItem in
            if let value = queryItem.value {
                parameters[queryItem.name] = value
            }
        }
        return parameters
    }
}
