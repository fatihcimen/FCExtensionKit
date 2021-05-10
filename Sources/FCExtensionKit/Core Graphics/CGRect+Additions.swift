//
//  CGRect+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 19.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import CoreGraphics

// MARK: - Initialize Helpers
public extension CGRect {
    
    /// Initialize with x, y and size
    init(x: CGFloat, y: CGFloat, size: CGSize) {
        self.init(origin: CGPoint(x: x, y: y), size: size)
    }
    
    /// Initialize with origin, width and height
    init(origin: CGPoint, width: CGFloat, height: CGFloat) {
        self.init(origin: origin, size: CGSize(width: width, height: height))
    }
}
