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
struct Symbol {
    var character : Character
    var frequency : Int
    var range : Range?
    
    init(character : Character, frequency : Int) {
        self.character = character
        self.frequency = frequency
    }
}

struct Range {
    var lower : Double
    var upper : Double
    
    init(lower: Double, upper : Double) {
        self.lower = lower
        self.upper = upper
    }
}