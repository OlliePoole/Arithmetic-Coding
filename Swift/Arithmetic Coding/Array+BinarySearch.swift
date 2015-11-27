//
//  Array+BinarySearch.swift
//  Arithmetic Coding
//
//  Created by Oliver Poole on 26/11/2015.
//  Copyright © 2015 OliverPoole. All rights reserved.
//

import Foundation

extension Array {
    
    func findClosestSymbolTo(encodedValue: Double) -> Symbol? {
        
        let low = 0
        let high = self.count - 1
        
        let middleIndex = (high - low) / 2
        
        // Get the middle of the array and cast it to a Symbol
        let middleSymbol = self[middleIndex] as! Symbol
        
        // Does the encoded value lie between the lower and upper ranges?
        if (encodedValue > middleSymbol.range!.lower) && (encodedValue < middleSymbol.range!.upper)  {
                
                return middleSymbol
        }
        else if (encodedValue < middleSymbol.range!.lower) {
            // take the lower half of the array
            let arraySegment = Array(self[0 ..< middleIndex])
            return arraySegment.findClosestSymbolTo(encodedValue)
        }
        else if (encodedValue > middleSymbol.range!.upper) {
            // take the upper half of the array
            let arraySegment = Array(self[middleIndex + 1 ..< self.count])
            return arraySegment.findClosestSymbolTo(encodedValue)
        }
        else {
            // haven't found a symbol matching that encoded value
            return nil
        }
    }
}
