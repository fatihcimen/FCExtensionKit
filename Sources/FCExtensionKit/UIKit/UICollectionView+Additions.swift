//
//  UICollectionView+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 21.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import UIKit

// MARK: - Reload Helpers
public extension UICollectionView {
    
    /// Reloads visibile items
    @objc func reloadVisibleItems() {
        self.reloadItems(at: self.indexPathsForVisibleItems)
    }
}

// MARK: - Scroll Helpers
public extension UICollectionView {
    
    /// Scrolls to row
    func scroll(to row: Int, position: UICollectionView.ScrollPosition = .centeredHorizontally, animated: Bool = true) {
        guard self.numberOfSections.isPositive  else { return }
        let numberOfItems = self.numberOfItems(inSection: 0)
        if numberOfItems.isPositive && row < numberOfItems {
            let indexPath = IndexPath(row: row, section: 0)
            self.scrollToItem(at: indexPath, at: position, animated: animated)
        }
    }
}

// MARK: - CollectionView Registers
public extension UICollectionView {
    
    /// Registers cell to collectionView
    ///
    /// - Parameter cellIdentifier: The reuse identifier to associate with the specified nib file. This parameter must not be nil and must not be an empty string.
    func registerCell(with cellIdentifier: String) {
        self.register(cellIdentifier.nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    /// Registers header to collectionView
    ///
    /// - Parameter cellIdentifier: The reuse identifier to associate with the specified nib file. This parameter must not be nil and must not be an empty string.
    func registerHeader(with cellIdentifier: String) {
        self.register(cellIdentifier.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: cellIdentifier)
    }
    
    /// Registers footer to collectionView
    ///
    /// - Parameter cellIdentifier: The reuse identifier to associate with the specified nib file. This parameter must not be nil and must not be an empty string.
    func registerFooter(with cellIdentifier: String) {
        self.register(cellIdentifier.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: cellIdentifier)
    }
}
