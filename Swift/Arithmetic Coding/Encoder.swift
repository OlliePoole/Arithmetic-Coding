//
//  Encoder.swift
//  Arithmetic Coding
//
//  Created by Oliver Poole on 24/11/2015.
//  Copyright © 2015 OliverPoole. All rights reserved.
//

import Foundation

class Encoder {
    
    /**
     Encodes a string input to double form
     
     - parameter inputString: The string to encode
     
     - returns: A tuple containing the frequency table used in the convertion and the encoded output
     */
    static func encode(inputString : String) -> (table : FrequencyTable, encodedInput : Double) {
        
        /**
         *  Creating the frequency table
         */
        let frequencyTable = FrequencyTable()
        
        let numberOfElements = inputString.characters.count
        
        let sortedInput = inputString.characters.sort()
        
        
        for char in sortedInput {
            frequencyTable.addValue(char)
        }
        
        
        var previousLower : Double = 0.0
        var probability : Double = 0.0
        
        // Assign the frequencies of each input character
        for symbol in frequencyTable.table.values {
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
        
        for inputSymbol in inputString.characters {
            
            let symbol = frequencyTable.symbolForElement(inputSymbol)!
            
            let range = high - low
            
            high = low + (symbol.range!.upper * range)
            low = low + (symbol.range!.lower * range)
            
            print(String(symbol.character) + " " + String(low) + " " + String(range))
        }
        
        // Return the frequency table, and the average of the low and high values
        return (frequencyTable, ((low + high) / 2.0))
    }
}