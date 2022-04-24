//
//  Collection+Ex.swift
//  Template
//
//  Created by Lam Nguyen on 4/24/22.
//

import Foundation

public extension Array where Element: Equatable {
    // Remove first collection element that is equal to the given `object`:
    @discardableResult
    mutating func remove(object: Element) -> Int? {
        if let index = firstIndex(of: object) {
            remove(at: index)
            return index
        }

        return nil
    }

    func indexOf(object: Element) -> Int? {
        guard (self as NSArray).contains(object) else { return nil }
        return (self as NSArray).index(of: object)
    }

    @discardableResult
    mutating func removeFirstSafe() -> Element? {
        guard self.count > 0 else { return nil }
        return self.removeFirst()
    }

    @discardableResult
    mutating func removeLastSafe() -> Element? {
        guard self.count > 0 else { return nil }
        return self.removeLast()
    }
}
