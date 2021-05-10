//
//  Collection+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 22.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

public extension Collection {
    subscript(index index: Index) -> Iterator.Element? {
        return self.indices.contains(index) ? self[index] : nil
    }
}
