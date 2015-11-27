//
//  main.swift
//  Arithmetic Coding
//
//  Created by Oliver Poole on 22/11/2015.
//  Copyright © 2015 OliverPoole. All rights reserved.
//

import Foundation

var encoding = Encoder.encode("BILL GATES")
var table = encoding.table
var low = encoding.encodedInput

var decoding = Decoder.decode(table, encodedValue: low)

print(decoding)