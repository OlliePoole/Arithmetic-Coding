//: Playground - noun: a place where people can play

import Cocoa

/**
 *  A structure to represent an input character
 */
struct Symbol {
    var character : Character
    var frequency : Int
    
    struct Range {
        var lower : Double
        var upper : Double
    }
}

/**
 *  The table used to store the frequencies of the characters
 *  in the input string
 */
struct FrequencyTable {
    
    class TableNode {
        var symbol : Symbol
        var next : TableNode?
        
        init(symbol : Symbol, next : TableNode?) {
            self.symbol = symbol
            self.next = next
        }
    }
    
    var table : Array<TableNode!>
    
    init(capactiy : Int) {
        table = Array<TableNode!>(count: capactiy, repeatedValue: nil)
    }
    
    mutating func addValue(element : Character) {
        
        let hashValue = hash(element)
        
        // If the element at the hash value is not empty
        if let existingNode = table[hashValue] {
            
            // Does the table node at that hash value match the element
            if existingNode.symbol.character == element {
                existingNode.symbol.frequency++
            }
            else {
                // Chain a new node to the existing table node
                let node = TableNode(symbol: Symbol(character: element, frequency: 1), next: existingNode)
                table[hashValue] = node
            }
        }
        else { // Create a new node, and add it to the table
            let symbol = Symbol(character: element, frequency: 1)
            table[hashValue] = TableNode(symbol: symbol, next: nil)
        }
    }
    
    private func hash(element : Character) -> Int {
        return element.hashValue % table.count
    }
}




/**
    Main
*/


var frequencyTable = FrequencyTable(capactiy: 50)

let inputString = "BILL GATES"

for char in inputString.characters {
    frequencyTable.addValue(char)
}

for tableNode in frequencyTable.table {
    // TODO: Calculate the ranges for each element in the hash table
}

// TODO: Run algorithm

