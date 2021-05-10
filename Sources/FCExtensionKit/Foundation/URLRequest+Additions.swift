//
//  URLRequest+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 22.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import Foundation

// MARK: - Append QueryItem
public extension URLRequest {
    
    /// Appends QueryItem
    mutating func append(queryItem: URLQueryItem) {
        guard let url = self.url, var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return }
        
        var items = urlComponents.queryItems ?? []
        items.append(queryItem)
        urlComponents.queryItems = items
        self.url = urlComponents.url
    }
}
