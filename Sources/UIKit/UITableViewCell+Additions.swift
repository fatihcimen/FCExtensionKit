//
//  UITableViewCell+Additions.swift
//  FCExtensionKit
//
//  Created by Erinç Olkan Dokumacıoğlu on 22.04.2022.
//

import UIKit

public extension UITableViewCell {
    /// Creates a static reuse identifier for table view cell using its class name.
    ///
    /// - Warning: If you are using xib files for your cell design, you are obliged to manually assign a reuse identifier for your cell in the Interface Builder.
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
