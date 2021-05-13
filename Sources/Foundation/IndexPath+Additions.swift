//
//  IndexPath+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 22.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import Foundation

// MARK: - Checks First Row
public extension IndexPath {
    
    /// Cheks is first row
    var isFirstRow: Bool {
        return self.row == 0
    }
}
