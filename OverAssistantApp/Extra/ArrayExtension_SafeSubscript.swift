//
//  ArrayExtension_SafeSubscript.swift
//  OverAssistantApp
//
//  Created by Александр Губанов on 11.08.2020.
//

import Foundation

extension Array {
    
    public subscript(safeIndex index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }
        
        return self[index]
    }
}
