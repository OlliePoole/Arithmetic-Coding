//
//  main.swift
//  Arithmetic Coding
//
//  Created by Oliver Poole on 22/11/2015.
//  Copyright © 2015 OliverPoole. All rights reserved.
//

import Foundation

/**
*  Creating the frequency table
*/

var frequencyTable = FrequencyTable()

let inputString = "BILL GATES"
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
    
    // Set the previous lower for the next symbol
    previousLower = probability + previousLower
}



/**
*  Encoding the input string
*/

var low : Double = 0.0
var high : Double = 1.0

for inputSymbol in inputString.characters {
    var range = high - low
    
    let symbol = frequencyTable.symbolForElement(inputSymbol)!
    
    high = low + (symbol.range!.upper * range)
    low = low + (symbol.range!.lower * range)
}



var outputString = ""

while low.roundToPlaces(2) > 0.0 {
    var lowerString = String(low)
    
    // Use substring to get the first decimal (e.g. "0.787" -> "0.7")
    var firstDigitString = lowerString.substringWithRange(Range<String.Index>(start: lowerString.startIndex, end: lowerString.startIndex.advancedBy(3)))
    
    // find the element with that range
    let firstDigitDouble = Double(firstDigitString)!
    
    for symbol in frequencyTable.table {
        if firstDigitDouble >= symbol.range!.lower.roundToPlaces(3) && firstDigitDouble < symbol.range?.upper.roundToPlaces(3) {
            outputString += String(symbol.character)
            
            // Subtract original lower by the symbol's lower
            low -= symbol.range!.lower
            
            // Divide by frequency to get the next number
            low /= (Double(symbol.frequency) / 10.0)
            
            break
        }
    }
    
    print("output : " + outputString)
    print("lower : " + String(low))
}

print(outputString)


