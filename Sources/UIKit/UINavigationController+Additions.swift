//
//  UINavigationController+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 21.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import UIKit

// MARK: - Navigation Controller Helpers
public extension UINavigationController {
    
    var rootViewController: UIViewController? {
        return viewControllers.first
    }
    
    ///Get previous view controller of the navigation stack
    @objc var previousViewController: UIViewController? {
        let lenght = self.viewControllers.count
        
        let previousViewController: UIViewController? = lenght >= 2 ? self.viewControllers[lenght - 2] : nil
        
        return previousViewController
    }
    
    func safePushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewController.isNavigated(by: self) { return }
        
        if self.viewControllers.isEmpty {
            setViewControllers([viewController], animated: false)
        }
        else {
            pushViewController(viewController, animated: animated)
        }
    }
    
    var canPopViewController: Bool {
        return viewControllers.count > 1
    }
}
