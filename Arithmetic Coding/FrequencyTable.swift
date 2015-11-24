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
    
    var table = Array<Symbol>()
    
    mutating func addValue(element : Character) {
        let symbol = Symbol(character: element, frequency: 1)
        
        if table.contains(symbol) {
            let index = table.indexOf(symbol)
            
            table[index!].frequency++
        }
        else {
            table.append(symbol)
        }
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