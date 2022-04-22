//
//  UITableViewCell+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Erinç Olkan Dokumacıoğlu on 22.04.2022.
//

import XCTest
import UIKit
@testable import FCExtensionKit

class UITableViewCell_AdditionsTests: XCTestCase {
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        
        tableView = UITableView()
        tableView.register(FakeTableViewCell.self, forCellReuseIdentifier: FakeTableViewCell.reuseIdentifier)
    }
    
    func testCanDequeueCellUsingReuseIdentifier() {
        let cell = tableView.dequeueReusableCell(withIdentifier: FakeTableViewCell.reuseIdentifier) as? FakeTableViewCell
        
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.reuseIdentifier, FakeTableViewCell.reuseIdentifier)
    }
}
