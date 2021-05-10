//
//  Double+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 20.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import CoreGraphics
import Foundation

// MARK: - Price Formatting
public extension Double {
    
    // Creating a formatter is expensive, so we should do it only once.
    static var priceFormatter: NumberFormatter?
    
    /// Returns formatted percentage
    var formattedPercentage: String {
        return String(format: "%%%.f", self)
    }
    
    /// Returns price without currency
    var formattedPrice: String? {
        return priceToString(with: nil)
    }
    
    /// Formatting price with currency
    ///
    /// - Parameter currency: Currency String
    /// - Returns: Returns formatted price with currency
    func priceToString(with currency: String?) -> String? {
        if Double.priceFormatter == nil {
            Double.priceFormatter = NumberFormatter()
            Double.priceFormatter?.numberStyle = .decimal
            Double.priceFormatter?.minimumFractionDigits = 2
            Double.priceFormatter?.maximumFractionDigits = 2
            Double.priceFormatter?.decimalSeparator = ","
            Double.priceFormatter?.groupingSeparator = "."
        }
        
        var price: String = Double.priceFormatter?.string(from: self as NSNumber) ?? ""
        if let currency = currency, currency.isNotEmpty {
            price = "\(price) \(currency)"
        }
        return price
    }
}

// MARK: - Double to time converters
public extension Double {
    var millisecond: TimeInterval  { return self / 1000 }
    var second: TimeInterval       { return self }
    var minute: TimeInterval       { return self * 60 }
    var hour: TimeInterval         { return self * 3600 }
    var day: TimeInterval          { return self * 3600 * 24 }
}

// MARK: - Double to CGFloat converter
public extension Double {
    var cgFloatValue: CGFloat {
        return CGFloat(self)
    }
}

// MARK: - Double to CGFloat converter
public extension Double {
    var floatValue: Float {
        return Float(self)
    }
}
