//
//  FrequencyTable.swift
//  Arithmetic Coding
//
//  Created by Oliver Poole on 22/11/2015.
//  Copyright © 2015 OliverPoole. All rights reserved.
//

import Foundation
import Cocoa

class FrequencyTable {
    
    /// The structure to store the elements
    var table = Dictionary<Character, Symbol>()
    
    /// Store the number of elements to know when to stop decoding
    var numberOfElements = 0
    
    /**
     Adds a new element to the table
     
     - parameter element: The element to add
     */
    func addValue(element : Character) {
        var symbol = table[element]
        
        // If there is no symbol for that character
        if symbol == nil {
            symbol = Symbol(character: element, frequency: 1)
            
            table[element] = symbol
        }
        else {
            // Increment the existing character symbol
            symbol?.frequency++
        }
        
        numberOfElements++
    }
    
    
    /**
     Finds the symbol representation of the input element
     
     - parameter element: The element
     
     - returns: The symbol if present, if symbol cannot be found then nil
     */
    func symbolForElement(element : Character) -> Symbol? {
        
        // If the element exists, return it, else return nil
        return table[element] == nil ? nil : table[element]
    }
}