//
//  Array+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 18.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import Foundation

// MARK: - Element return and check invalid index
public extension Array {
    
    /// Returns the element in the given index. Returns nil if index is invalid.
    ///
    /// - Parameter index: Array index
    /// - Returns: Array element
    func get(_ index: Index) -> Element? {
        guard index >= 0 && index < count else { return nil }
        return self[index]
    }
}

// MARK: - Remove element
public extension Array where Element: Equatable {
    
    /// Removes given element if it is in this array. Otherwise it does nothing.
    mutating func remove(element: Element) {
        if let index = firstIndex(of: element) {
            remove(at: index)
        }
    }
}


// MARK: - Increase and decrease at index by given value
public extension Array where Element == Int {
    
    /// Increments value at index by given value. It is thread-unsafe.
    mutating func increment(at index: Index, by: Element = 1) {
        guard let value = get(index) else { return }
        self[index] = value + by
    }
    
    /// Decrements value at index by given value. It is thread-unsafe.
    mutating func decrement(at index: Index, by: Element = 1) {
        guard let value = get(index) else { return }
        self[index] = value - by
    }
}

// MARK: - Join elements in a NSAttributedString
public extension Array where Element == NSAttributedString {
    
    /// Join elements with a separator in a NSAttributedString
    ///
    /// - Parameter separator: Combiner element
    /// - Returns: Joined elements in the NSAttributedString
    func joined(separator: Element) -> Element {
        let result = NSMutableAttributedString()
        enumerated().forEach { index, element in
            result.append(element)
            if index != count - 1 {
                result.append(separator)
            }
        }
        
        return NSAttributedString(attributedString: result)
    }
}

// MARK: - Pair elements
public extension Array {
    
    /// Pairs an element and next element in the array
    var pairs: AnySequence<(Element, Element?)> {
        var iterator = makeIterator()
        return AnySequence {
            return AnyIterator<(Element, Element?)> {
                guard let first = iterator.next() else { return nil }
                
                let second = iterator.next()
                return (first, second)
            }
        }
    }
}

// MARK: - Empty Array Check
public extension Array {
    /// Checks if the array is not empty.
    var isNotEmpty: Bool { return !isEmpty }
}
