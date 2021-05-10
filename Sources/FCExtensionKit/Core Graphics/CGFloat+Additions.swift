//
//  CGFloat+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 19.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import CoreGraphics

// MARK: - Max and Min Magnitudes
public extension CGFloat {
    
    /// The greatest finite number representable by this type.
    static var max: CGFloat {
        return .greatestFiniteMagnitude
    }
    
    /// The least positive normal number.
    static var min: CGFloat {
        return .leastNormalMagnitude
    }
}
