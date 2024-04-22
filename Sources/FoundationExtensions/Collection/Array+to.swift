//
//  Array+to.swift
//
//
//  Created by Ahmed Yamany on 22/04/2024.
//

import Foundation

public extension Array where Element == Data {
    func  toURL() -> [URL] {
        // swiftlint: disable force_unwrapping
        map { URL(dataRepresentation: $0, relativeTo: nil) }.filter { $0 != nil }.map { $0! }
        // swiftlint: enable force_unwrapping
    }
}

public extension Array where Element == URL {
    func toData() -> [Data] {
        // swiftlint: disable force_unwrapping
        self.map {
            guard $0.startAccessingSecurityScopedResource() else {
                debugPrint("Error: could not access content of url: \($0)")
                return nil
            }
            return try? Data(contentsOf: $0)
        }
        .filter { $0 != nil }.map { $0! }
        // swiftlint: enable force_unwrapping
    }
}

public extension Array where Element == any Equatable {
    mutating
    func replaceOrAppend<KeyPathType: Equatable>(
        _ item: Element,
        by keyPath: KeyPath<Element, KeyPathType>
    ) {
        if let index = firstIndex(where: { $0[keyPath: keyPath] == item[keyPath: keyPath]}) {
            self[index] = item
        } else {
            self.append(item)
        }
        
    }
    
    mutating 
    func replaceOrAppend<KeyPathType: Equatable>(
        contentsOf items: [Element],
        by keyPath: KeyPath<Element, KeyPathType>
    ) {
        for item in items {
            self.replaceOrAppend(item, by: keyPath)
        }
    }
}
