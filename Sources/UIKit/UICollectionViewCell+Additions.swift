//
//  UICollectionViewCell+Additions.swift
//  FCExtensionKit
//
//  Created by Erinç Olkan Dokumacıoğlu on 22.04.2022.
//

import UIKit

extension UICollectionViewCell {
    /// Automatically changes reuse identifier property of an xib designed cell.
    open override var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    /// Creates a static reuse identifier for collection view cell using its class name.
    public static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
