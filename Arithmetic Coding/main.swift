//
//  main.swift
//  Arithmetic Coding
//
//  Created by Oliver Poole on 22/11/2015.
//  Copyright © 2015 OliverPoole. All rights reserved.
//

import Foundation


var frequencyTable = FrequencyTable(capactiy: 50)

let inputString = "BILL GATES"
let numberOfElements = inputString.characters.count

for char in inputString.characters {
    frequencyTable.addValue(char)
}

var previousLower = 0.0
var probability = 0.0

// Remove the nil values from the table
frequencyTable.table = frequencyTable.table.filter { $0 != nil }


// Assign the range to each element
for tableNode in frequencyTable.table {
    probability = Double(tableNode.symbol.frequency) / Double(numberOfElements)
    
    tableNode.symbol.range = Range(lower: previousLower, upper: probability + previousLower)
    
    previousLower = probability + previousLower
}

// TODO: Run algorithm

