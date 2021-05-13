//
//  UIViewController+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 12.02.2020.
//  Copyright © 2020 Fatih Çimen. All rights reserved.
//


import XCTest
import UIKit

class UIViewController_AdditionsTests: XCTestCase {
    
    // MARK: - Properties
    let viewController = UIViewController()
    var navigationController: UINavigationController?

    lazy var mainViewController: UIViewController = {
        let mainViewController = UIViewController()
        
        let window = UIWindow()
        window.rootViewController = mainViewController
        window.makeKeyAndVisible()
        
        return mainViewController
    }()
    
    override func setUp() {
        navigationController = UINavigationController()
    }
    
    override func tearDown() {
        navigationController = nil
    }
    
    func testIsNavigated() {
        navigationController?.pushViewController(viewController, animated: false)
        XCTAssertTrue(viewController.isNavigated(by: navigationController ?? UINavigationController()))
    }
    
    func testIsNotNavigated() {
        XCTAssertFalse(viewController.isNavigated(by: navigationController ?? UINavigationController()))
    }
    
    /// ViewController
    func testIsPresentedViewController() {
        mainViewController.present(viewController, animated: false, completion: nil)
        
        XCTAssertTrue(viewController.isPresentedViewController)
    }
    
    /// NavigationController
    func testIsPresentedViewControllerNavigation() {
        mainViewController.present(navigationController ?? UINavigationController(), animated: false, completion: nil)
        
        navigationController?.pushViewController(viewController, animated: false)
        
        XCTAssertTrue(viewController.isPresentedViewController)
    }
    
    /// TabBar
    func testIsPresentedViewControllerTabBar() {
    }
    
    func testIsPresentedViewControllerFalse() {
        XCTAssertFalse(mainViewController.isPresentedViewController )
    }
    
    func testShowLeftBarButtonItemIfPresentedFalse() {
        viewController.showLeftBarButtonItemIfPresented(title: "Test", image: nil, action: #selector(emptySelector))
        
        XCTAssertNil(viewController.navigationItem.leftBarButtonItem)
    }
    
    func testShowLeftBarItemIfPresented() {
        mainViewController.present(navigationController ?? UINavigationController(), animated: false, completion: nil)
        
        navigationController?.pushViewController(viewController, animated: false)
        
        viewController.showLeftBarButtonItemIfPresented(title: "Test", image: nil, action: #selector(emptySelector))
        
        let leftButtonItem = UIBarButtonItem(title: "Test", style: .plain, target: self, action: #selector(emptySelector))
        
        XCTAssertNotNil(viewController.navigationItem.leftBarButtonItem)
        XCTAssertEqual(viewController.navigationItem.leftBarButtonItem?.title, leftButtonItem.title)
        XCTAssertEqual(viewController.navigationItem.leftBarButtonItem?.style, leftButtonItem.style)
        XCTAssertEqual(viewController.navigationItem.leftBarButtonItem?.action, leftButtonItem.action)
    }
    
    func testShowLeftBarItemIfPresentedWithImage() {
        mainViewController.present(navigationController ?? UINavigationController(), animated: false, completion: nil)
        
        navigationController?.pushViewController(viewController, animated: false)
        
        viewController.showLeftBarButtonItemIfPresented(title: nil, image: UIImage(), action: #selector(emptySelector))
        
        let leftButtonItem = UIBarButtonItem(
            image: UIImage(), style: .plain, target: nil, action: #selector(emptySelector))
        
        XCTAssertNotNil(viewController.navigationItem.leftBarButtonItem)
        XCTAssertEqual(viewController.navigationItem.leftBarButtonItem?.image, leftButtonItem.image)
        XCTAssertEqual(viewController.navigationItem.leftBarButtonItem?.style, leftButtonItem.style)
        XCTAssertEqual(viewController.navigationItem.leftBarButtonItem?.action, leftButtonItem.action)
    }
    
    // MARK: - Helpers
    @objc private func emptySelector() {}
}
