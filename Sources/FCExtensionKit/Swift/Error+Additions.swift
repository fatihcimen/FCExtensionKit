//
//  Error+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 20.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import Foundation

// MARK: - Error Code From NSError
public extension Error {
    
    /// Added code to Error, it takes from NSError
    var code: Int { return (self as NSError).code }
    
    /// Added domain to Error, it takes from NSError
    var domain: String { return (self as NSError).domain }
}
