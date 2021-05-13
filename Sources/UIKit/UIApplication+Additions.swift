//
//  UIApplication+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 21.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import UIKit

// MARK: - Debug Mode
public extension UIApplication {
    
    /// Checks Debug Mode
    static var isDebug: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
}

// MARK: - Top View Controller
public extension UIApplication {
    
    private func topViewController(of viewController: UIViewController) -> UIViewController {
        if let presented = viewController.presentedViewController {
            return topViewController(of: presented)
        }
        else if let navigation = viewController as? UINavigationController {
            if let visible = navigation.visibleViewController {
                return topViewController(of: visible)
            }
            else if let last = navigation.topViewController {
                return topViewController(of: last)
            }
            return navigation
        }
        else if let tabBar = viewController as? UITabBarController {
            if let selected = tabBar.selectedViewController {
                return topViewController(of: selected)
            }
            else if let first = tabBar.viewControllers?.first {
                return topViewController(of: first)
            }
            return tabBar
        }
        else {
            return viewController
        }
    }
    
    @objc func topViewController() -> UIViewController? {
        // It is good to define this call as a method instead of a computed property
        // for letting the user know this introspection is relatively time consuming.
        
        guard let root = self.delegate?.window??.rootViewController else { return nil }
        return topViewController(of: root)
    }
}
