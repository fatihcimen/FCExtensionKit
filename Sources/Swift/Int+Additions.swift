//
//  Int+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 21.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

// MARK: - Positive Int
public extension Int {
    
    /// Checks, Int is positive
    var isPositive: Bool {
        return self > 0
    }
    
    /// Checks, Int is negative
    var isNegative: Bool {
        return self < 0
    }
}

// MARK: - Coverters
public extension Int {
    var stringValue: String? {
        return String(self)
    }
}
