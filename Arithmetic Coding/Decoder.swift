//
//  Decoder.swift
//  Arithmetic Coding
//
//  Created by Oliver Poole on 24/11/2015.
//  Copyright © 2015 OliverPoole. All rights reserved.
//

import Foundation


class Decoder {
    
    static func decode(frequencyTable : FrequencyTable, var encodedValue : Double) -> String {
        
        var outputString = ""
        
        for _ in 1...frequencyTable.numberOfElements {
            
            for symbol in frequencyTable.table {
                if encodedValue >= symbol.range!.lower.roundToPlaces(2) && encodedValue < symbol.range?.upper.roundToPlaces(2) {
                    outputString += String(symbol.character)
                    
                    // Subtract original lower by the symbol's lower
                    encodedValue -= symbol.range!.lower
                    
                    // Divide by frequency to get the next number
                    encodedValue /= (Double(symbol.frequency) / 10.0)
                    
                    break
                }
            }
            
            print("output : " + outputString)
            print("lower : " + String(encodedValue))
        }
        
        return outputString
    }
}