//
//  UIEdgeInsets+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 22.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import UIKit

// MARK: - Custom Initializers
public extension UIEdgeInsets {
    
    /// Initialize with edges
    init(edges: CGFloat) {
        self.init(horizontal: edges, vertical: edges)
    }
    
    /// Initialize with horizontal and vertical
    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
}

// MARK: - EdgeInsets to Negative
public extension UIEdgeInsets {
    var negated: UIEdgeInsets {
        return UIEdgeInsets(top: -top, left: -left, bottom: -bottom, right: -right)
    }
    
    mutating func negate() {
        self = negated
    }
}
