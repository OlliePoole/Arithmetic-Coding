//
//  Symbol.swift
//  Arithmetic Coding
//
//  Created by Oliver Poole on 22/11/2015.
//  Copyright © 2015 OliverPoole. All rights reserved.
//

import Foundation

/**
 *  A structure to represent an input character
 */
class Symbol {
    /// The character the symbol represents
    var character : Character
    
    /// The frequency of the character in the table
    var frequency : Int
    
    /// The range of the symbol (0.0 >= n <= 1.0]
    var range : SymbolRange? // ? = can be nil
    
    init(character : Character, frequency : Int) {
        self.character = character
        self.frequency = frequency
    }
}

/**
 *  A structure to represent the lower and upp range values
 *  assigned to a Symbol object
 */
struct SymbolRange {
    var lower : Double
    var upper : Double
    
    init(lower: Double, upper : Double) {
        self.lower = lower
        self.upper = upper
    }
}