//
//  NSNumber+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 20.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import CoreGraphics
import Foundation

// MARK: - NSNumber Helpers
public extension NSNumber {
    
    /// Converts doubleValue to CGFloat
    var cgFloatValue: CGFloat {
        return CGFloat(doubleValue)
    }
}
