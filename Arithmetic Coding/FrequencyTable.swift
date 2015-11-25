//
//  FrequencyTable.swift
//  Arithmetic Coding
//
//  Created by Oliver Poole on 22/11/2015.
//  Copyright © 2015 OliverPoole. All rights reserved.
//

import Foundation
import Cocoa

struct FrequencyTable {
    
    /// The structure to store the elements
    var table = Array<Symbol>()
    
    /// Store the number of elements to know when to stop decoding
    var numberOfElements = 0
    
    mutating func addValue(element : Character) {
        let symbol = Symbol(character: element, frequency: 1)
        
        if table.contains(symbol) {
            let index = table.indexOf(symbol)
            
            table[index!].frequency++
        }
        else {
            table.append(symbol)
        }
        
        numberOfElements++
    }
    
    func symbolForElement(element : Character) -> Symbol? {
        let symbol = Symbol(character: element, frequency: 1)
        if table.contains(symbol) {
            let index = table.indexOf(symbol)
            
            return table[index!]
        }
        
        return nil
    }
}