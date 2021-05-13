//
//  UINavigation+AdditionsTest.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 14.02.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import XCTest

class UINavigation_AdditionsTests: XCTestCase {
    
    // MARK: - Private Properties
    private var navigationController: UINavigationController?
    
    override func setUp() {
        super.setUp()
        
        navigationController = UINavigationController()
    }
    
    override func tearDown() {
        super.tearDown()
        
        navigationController = nil
    }
    
    func testRootViewController() {
        let viewController = UIViewController()
        
        navigationController?.pushViewController(viewController, animated: false)
        
        XCTAssertEqual(navigationController?.rootViewController, viewController)
    }
    
    func testPreviousViewController() {
        let viewController1 = UIViewController()
        let viewController2 = UIViewController()
        
        navigationController?.setViewControllers([viewController1, viewController2], animated: false)
        
        XCTAssertEqual(navigationController?.previousViewController, viewController1)
    }
    
    func testPreviousViewControllerNil() {
        let viewController = UIViewController()
        
        navigationController?.setViewControllers([viewController], animated: false)
        
        XCTAssertNil(navigationController?.previousViewController)
    }
    
    func testSafePushViewControllerSingle() {
        let viewController = UIViewController()
        
        navigationController?.safePushViewController(viewController, animated: false)
        
        XCTAssertNotNil(navigationController?.viewControllers)
    }
    
    func testSafePushViewController() {
        let viewController1 = UIViewController()
        let viewController2 = UIViewController()
        
        navigationController?.viewControllers = [viewController1]
        
        navigationController?.safePushViewController(viewController2, animated: false)
        
        XCTAssertEqual(navigationController?.viewControllers.count, 2)
    }
    
    func testSafePushViewControllerNavigated() {
        let viewController1 = UIViewController()
        let viewController2 = UIViewController()
        
        navigationController?.viewControllers = [viewController1, viewController2]
        
        navigationController?.safePushViewController(viewController2, animated: false)
        
        XCTAssertEqual(navigationController?.viewControllers.count, 2)
    }
    
    func testCanPopViewController() {
        guard let navigationController = navigationController else { return }
        let viewController1 = UIViewController()
        let viewController2 = UIViewController()
        
        navigationController.setViewControllers([viewController1, viewController2], animated: false)
        
        XCTAssertTrue(navigationController.canPopViewController)
    }
    
    func testCanPopViewControllerFalse() {
        guard let navigationController = navigationController else { return }
        XCTAssertFalse(navigationController.canPopViewController)
    }
}
