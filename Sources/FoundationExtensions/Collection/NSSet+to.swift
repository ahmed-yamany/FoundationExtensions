//
//  NSSet+to.swift
//
//
//  Created by Ahmed Yamany on 22/04/2024.
//

import Foundation

public extension NSSet {
    func toArray<T>() -> [T] {
        // swiftlint: disable all
        let array = self.map { $0 as? T }.filter {$0 != nil}.map { $0! }
        // swiftlint: enable all
        return array
    }
}
