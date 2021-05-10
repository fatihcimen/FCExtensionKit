//
//  CGSize+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 19.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import CoreGraphics

// MARK: - Calculations
public extension CGSize {
    
    /// Max width and height
    static var max: CGSize {
        return CGSize(width: .max, height: .max)
    }
    
    /// Ceiled width and height
    var ceiled: CGSize {
        return CGSize(width: ceil(width), height: ceil(height))
    }
    
    /// Floored width and height
    var floored: CGSize {
        return CGSize(width: floor(width), height: floor(height))
    }
    
    /// CGSize to rect
    var toRect: CGRect {
        return CGRect(origin: .zero, size: self)
    }
    
    /// Init square CGSize
    ///
    /// - Parameter size: For square size
    init(size: CGFloat) {
        self.init(width: size, height: size)
    }
}
