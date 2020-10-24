//
//  SequenceExtension_SortedWithKeyPath.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 24.10.2020.
//

import Foundation

extension Sequence {
    
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        return sorted { firstElement, secondElement in
            return firstElement[keyPath: keyPath] < secondElement[keyPath: keyPath]
        }
    }
}
