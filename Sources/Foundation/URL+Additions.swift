//
//  URL+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 22.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import Foundation

extension URL: URLConvertible {
    public var url: URL? {
        return self
    }
    
    public var urlString: String {
        return self.absoluteString
    }
}

// MARK: - Query Parameters
public extension URL {
    
    /// Adds query parameters to url
    func appendingQueryParameters(_ parameters: [String: String]) -> URL {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        var items = urlComponents.queryItems ?? []
        items += parameters.map({ URLQueryItem(name: $0, value: $1) })
        urlComponents.queryItems = items
        return urlComponents.url!
    }
}

// MARK: - URL Scheme and Host Type Helpers
public enum URLSchemeType: String {
    case none
    case unknown
    case http
    case https
    case blob
    
    init(url: URL?) {
        guard let scheme = url?.scheme else {
            self = .none
            return
        }
        
        if let schemeType = URLSchemeType(rawValue: scheme.lowercased()) {
            self = schemeType
            return
        }
        
        self = .unknown
    }
}

public extension URL {
    var schemeType: URLSchemeType {
        return URLSchemeType(url: self)
    }
}

// MARK: - URL Helpers
public extension URL {
    var isAnyHTTP: Bool {
        return self.schemeType == .http || self.schemeType == .https
    }
}

// MARK: - Search Engines
public extension URL {
    enum SearchEngine: String {
        case bing, google, yaani, yahoo, yandex
        
        init?(with url: URL) {
            guard let host = url.host else { return nil }
            
            if host.contains(SearchEngine.bing.rawValue) {
                self = .bing
            }
            
            else if host.contains(SearchEngine.google.rawValue) {
                self = .google
            }
            
            else if host.contains(SearchEngine.yaani.rawValue) {
                self = .yaani
            }
            
            else if host.contains(SearchEngine.yahoo.rawValue) {
                self = .yahoo
            }
            
            else if host.contains(SearchEngine.yandex.rawValue) {
                self = .yandex
            }
            
            else {
                return nil
            }
        }
    }
    
    var searchEngine: SearchEngine? {
        guard let searchEngine = SearchEngine(with: self) else { return nil }
        return searchEngine
    }
    
    var isSearchEngine: Bool {
        return self.searchEngine != nil
    }
}
