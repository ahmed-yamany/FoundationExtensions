//
//  NSSet+to.swift
//
//
//  Created by Ahmed Yamany on 22/04/2024.
//

import Foundation

public extension NSSet {
    func toArray<T>() -> [T] {
        var array: [T] = []
        for case let .some(i) in map({ $0 as? T }) {
            array.append(i)
        }
        return array
    }
}
