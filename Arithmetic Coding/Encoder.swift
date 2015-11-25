//
//  Encoder.swift
//  Arithmetic Coding
//
//  Created by Oliver Poole on 24/11/2015.
//  Copyright © 2015 OliverPoole. All rights reserved.
//

import Foundation

class Encoder {
    
    static func encode(inputString : String) -> (table : FrequencyTable, encodedInput : Double) {
        /**
         *  Creating the frequency table
         */
        
        var frequencyTable = FrequencyTable()
        
        let numberOfElements = inputString.characters.count
        
        let sortedInput = inputString.characters.sort()
        
        
        for char in sortedInput {
            frequencyTable.addValue(char)
        }
        
        
        var previousLower : Double = 0.0
        var probability : Double = 0.0
        
        // Assign the frequencies of each input character
        for symbol in frequencyTable.table {
            // Fetch the symbol just added
            
            probability = Double(symbol.frequency) / Double(numberOfElements)
            
            symbol.range = SymbolRange(lower: previousLower, upper: (probability + previousLower))
            
            print(String(symbol.character) + " lower: " + String(symbol.range!.lower) + " upper: " + String(symbol.range!.upper))
            
            // Set the previous lower for the next symbol
            previousLower = probability + previousLower
        }
        
        
        
        /**
         *  Encoding the input string
         */
        
        var low : Double = 0.0
        var high : Double = 1.0
        
        var range = high - low
        
        for inputSymbol in inputString.characters {
            
            let symbol = frequencyTable.symbolForElement(inputSymbol)!
            
            high = low + (symbol.range!.upper * range)
            low = low + (symbol.range!.lower * range)
            
            // Range = existing range * the previous symbol frequency / 10
            range = range * (Double(symbol.frequency) / 10.0)
            
            print(String(symbol.character) + " " + String(low) + " " + String(range))
        }
        
        return (frequencyTable, ((low + high) / 2.0))
    }
}