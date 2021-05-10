//
//  UITableView+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 21.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import UIKit

// MARK: - TableView Reload Helpers
public extension UITableView {
    
    /// Reloads visibile cells
    @objc func reloadVisibleCells() {
        if let indexPaths = self.indexPathsForVisibleRows {
            self.reloadRows(at: indexPaths, with: .automatic)
        }
    }
    
    /// Reload visible cells at indexPaths
    ///
    /// - Parameter indexPaths: An array of indexPaths objects identifying the rows to reload.
    @objc func reloadVisibleCells(at indexPaths: [IndexPath]) {
        if let visibleIndexPaths = self.indexPathsForVisibleRows {
            let commonIndexPaths = Set(visibleIndexPaths).intersection(indexPaths)
            self.reloadRows(at: Array(commonIndexPaths), with: .automatic)
        }
    }
}

// MARK: - TableView Scroll Helpers
public extension UITableView {
    
    /// Scrolls to first tableView row
    ///
    /// - Parameter animated: true if you want to animate the change in position; false if it should be immediate.
    @objc func scrollToFirstItem(animated: Bool = true) {
        if self.numberOfRows(inSection: 0).isPositive {
            self.scrollToRow(at: IndexPath(row: 0, section: 0), at: .middle, animated: animated)
        }
    }
}

// MARK: - Remove Header
public extension UITableView {
    
    /// Removes header if tableView style is grouped
    @objc func removeHeaderWhenGrouped() {
        if style == .grouped {
            tableHeaderView = UIView(frame: .zero)
        }
    }
}

// MARK: - TableView Registers
public extension UITableView {
    
    /// Registers cell to tableView
    /// - Parameter cellIdentifier: The reuse identifier to associate with the specified nib file. This parameter must not be nil and must not be an empty string.
    func registerCell(with cellIdentifier: String) {
        self.register(cellIdentifier.nib, forCellReuseIdentifier: cellIdentifier)
    }
}

// MARK: - TableView Helpers
public extension UITableView {
    
    /// Hides empty cells at the bottom
    @objc func hideEmptyCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
