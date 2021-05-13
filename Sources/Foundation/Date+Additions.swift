//
//  Date+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 22.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import Foundation

// MARK: - Date Helpers
public extension Date {
    
    var timePassedUntilNow: Double {
        return Date().timeIntervalSince(self)
    }
}
