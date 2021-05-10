//
//  UIViewController+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 22.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import UIKit

// MARK: - Navigation Control
public extension UIViewController {
    
    /// Checks current viewController is navigated
    func isNavigated(by navigationController: UINavigationController) -> Bool {
        return (self.navigationController == navigationController ||
                    navigationController.viewControllers.contains(self))
    }
}

// MARK: - Presented Controls
public extension UIViewController {
    
    /// Checks current viewController is presented
    var isPresentedViewController: Bool {
        if self.presentingViewController?.presentedViewController == self {
            return true
        }
        if self.navigationController != nil &&
            self.navigationController?.presentingViewController?.presentedViewController == self.navigationController &&
            self.navigationController?.viewControllers.first == self {
            return true
        }
        if self.tabBarController?.presentingViewController is UITabBarController {
            return true
        }
        return false
    }
    
    /// Adds a button if currentView controller is presented
    /// it takes title or image, title is priority
    ///
    /// - Parameters:
    ///   - title: BarButton title
    ///   - image: BarButton image
    ///   - action: Action
    @objc func showLeftBarButtonItemIfPresented(title: String?, image: UIImage?, action: Selector, accessibilityLabel: String? = nil) {
        guard isPresentedViewController else { return }
        
        if let title = title, !title.isEmpty {
            navigationItem.leftBarButtonItem = UIBarButtonItem(
                title: title, style: .plain, target: self, action: action)
        }
        else if let image = image {
            navigationItem.leftBarButtonItem = UIBarButtonItem(
                image: image, style: .plain, target: self, action: action)
        }
        
        if let accessibilityLabel = accessibilityLabel {
            navigationItem.leftBarButtonItem?.accessibilityLabel = accessibilityLabel
        }
    }
}

// MARK: - Alert
public extension UIViewController {
    
    /// Generates a UIAlertController and shows on viewController
    ///
    /// if viewController presented, it does not show alert.
    /// it adds statically 'Tamam' button.
    ///
    /// - Parameters:
    ///   - title: UIAlertController title
    ///   - message: UIAlertController message
    ///   - buttonTitle: UIAlertAction button text
    @objc func showAlert(title: String, message: String, buttonTitle: String = "Tamam") {
        if isPresentedViewController { return }
        
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        present(controller, animated: true, completion: nil)
    }
}
