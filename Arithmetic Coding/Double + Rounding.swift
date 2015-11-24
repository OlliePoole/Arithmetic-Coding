//
//  Double + Rounding.swift
//  Arithmetic Coding
//
//  Created by Oliver Poole on 24/11/2015.
//  Copyright © 2015 OliverPoole. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(self * divisor) / divisor
    }
}
