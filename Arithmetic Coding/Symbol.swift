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
    var character : Character
    var frequency : Int
    var range : SymbolRange?
    
    init(character : Character, frequency : Int) {
        self.character = character
        self.frequency = frequency
    }
}


extension Symbol : Equatable {}
    
    func ==(lhs: Symbol, rhs: Symbol) -> Bool {
        return lhs.character == rhs.character
    }



struct SymbolRange {
    var lower : Double
    var upper : Double
    
    init(lower: Double, upper : Double) {
        self.lower = lower
        self.upper = upper
    }
}