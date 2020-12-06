//
//  ArrayExtension_ValueSplitter.swift
//  OverAssistantApp
//
//  Created by Александр Губанов on 24.10.2020.
//

import Foundation

extension Array {
    
    func spitted<Value>(elementValue: (Element) -> Value) -> (firstPart: Self, secondPart: Self) where Value: SignedNumeric & Comparable {
        guard !isEmpty else {
            return (firstPart: [], secondPart: [])
        }
        guard count > 1 else {
            return (firstPart: self, secondPart: [])
        }
        var biggestGap: Value = 0
        var biggestGapIndex = 1
        var lastElement = self[0]
        
        for index in 1..<count {
            let currentElement = self[index]
            let currentValue = elementValue(currentElement)
            let lastValue = elementValue(lastElement)
            let gap = abs(currentValue - lastValue)
            
            if gap > biggestGap {
                biggestGap = gap
                biggestGapIndex = index
            }
            lastElement = currentElement
        }
        
        let firstPart = self.prefix(upTo: biggestGapIndex).map { $0 }
        let secondPart = self.dropFirst(biggestGapIndex).map { $0 }
        return (firstPart: firstPart, secondPart: secondPart)
    }
}
