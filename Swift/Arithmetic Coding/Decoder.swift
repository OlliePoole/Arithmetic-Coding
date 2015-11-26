//
//  Decoder.swift
//  Arithmetic Coding
//
//  Created by Oliver Poole on 24/11/2015.
//  Copyright © 2015 OliverPoole. All rights reserved.
//

import Foundation

class Decoder {
    
    /**
     Decodes the encoded double value
     
     - parameter frequencyTable: The table containing the frequencies of each character
     - parameter encodedValue:   The encoded value ready to be decoded
     
     - returns: A string containing the decoded value
     */
    static func decode(frequencyTable : FrequencyTable, var encodedValue : Double) -> String {
        
        var outputString = ""
        
        // Loop once for each character in the frequency table
        for _ in 1...frequencyTable.numberOfElements {
        
            // Find the symbol with a range that contains the encoded value
            for symbol in frequencyTable.table.values {
                
                if (encodedValue > symbol.range!.lower
                    || Int(encodedValue) == Int(symbol.range!.lower)) && (encodedValue < symbol.range!.upper)  {
                        
                    outputString += String(symbol.character)
                    
                    // DESC: encodedValue = (encoded - symbol_lower) / (symbol_upper - symbol_lower)
                    encodedValue = (encodedValue - symbol.range!.lower) / (symbol.range!.upper - symbol.range!.lower)
                    
                    break
                }
            }
        }
        
        return outputString
    }
}