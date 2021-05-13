//
//  Dictionary+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 20.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

// MARK: - Dictionary Helper
public extension Dictionary where Value: RangeReplaceableCollection {
    
    /// Dictionary Helper
    ///
    /// - Parameter key: The key to current value in the dictionary.
    subscript(collection key: Key) -> Value {
        set {
            self[key] = newValue
        }
        mutating get {
            if let value = self[key] {
                return value
            }
            else {
                let value = Value()
                self[key] = value
                return value
            }
        }
    }
}
