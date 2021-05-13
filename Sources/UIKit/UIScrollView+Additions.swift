//
//  UIScrollView+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 21.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import UIKit

// MARK: - Scroll Helpers
public extension UIScrollView {
    
    /// Scrolls to a specific view
    @objc(scrollToView:animated:)
    func scroll(to view: UIView, animated: Bool) {
        if view.isDescendant(of: self) {
            let point = self.convert(view.frame.origin, from: view.superview)
            setContentOffset(point, animated: animated)
        }
    }
}

// MARK: - ScrollView Bouncing Helpers
public extension UIScrollView {
    @objc enum ScrollingDirection: UInt {
        case unknown
        case up
        case down
    }
    
    var isBouncing: Bool {
        return isBouncingTop || isBouncingLeft || isBouncingBottom || isBouncingRight
    }
    
    @objc var isBouncingVertical: Bool {
        return isBouncingTop || isBouncingBottom
    }
    
    var isBouncingTop: Bool {
        return contentOffset.y < -contentInset.top
    }
    
    var isBouncingLeft: Bool {
        return contentOffset.x < -contentInset.left
    }
    
    var isBouncingBottom: Bool {
        let contentFillsScrollEdges = contentSize.height + contentInset.top + contentInset.bottom >= bounds.height
        return contentFillsScrollEdges && contentOffset.y > contentSize.height - bounds.height + contentInset.bottom
    }
    
    var isBouncingRight: Bool {
        let contentFillsScrollEdges = contentSize.width + contentInset.left + contentInset.right >= bounds.width
        return contentFillsScrollEdges && contentOffset.x > contentSize.width - bounds.width + contentInset.right
    }
}
