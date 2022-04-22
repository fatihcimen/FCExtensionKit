//
//  UICollectionViewCell+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Erinç Olkan Dokumacıoğlu on 22.04.2022.
//

import XCTest
import UIKit
@testable import FCExtensionKit

class UICollectionViewCell_AdditionsTests: XCTestCase {
    var collectionView: UICollectionView!
    
    override func setUp() {
        super.setUp()
        
        let layout = UICollectionViewLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FakeCollectionViewCell.self, forCellWithReuseIdentifier: FakeCollectionViewCell.reuseIdentifier)
    }
    
    func testCanDequeueCellUsingInstanceVariableReuseIdentifier() {
        let cellInstance = FakeCollectionViewCell()
        let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellInstance.reuseIdentifier, for: IndexPath(row: 0, section: 0)) as? FakeCollectionViewCell
        
        XCTAssertNotNil(dequeuedCell)
        XCTAssertEqual(dequeuedCell?.reuseIdentifier, FakeCollectionViewCell.reuseIdentifier)
    }
    
    func testCanDequeueCellUsingStaticReuseIdentifier() {
        let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: FakeCollectionViewCell.reuseIdentifier, for: IndexPath(row: 0, section: 0)) as? FakeCollectionViewCell
        
        XCTAssertNotNil(dequeuedCell)
        XCTAssertEqual(dequeuedCell?.reuseIdentifier, FakeCollectionViewCell.reuseIdentifier)
    }
}
