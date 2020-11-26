//
//  Card.swift
//  PP2 - Game "Set"
//
//  Created by Михайло Єрошенко on 10.10.2020.
//

import Foundation

struct Card: Hashable {
    
    // Nested enum for choosing value of each property of the card
    enum Value: Int {
        case v1 = 1
        case v2
        case v3
    }
    
    // Variable for making unique ID
    private static var idFactory = 0
    
    // Func makes unique ID for each card
    private static func getUniqueIdentifier() -> Int {
        idFactory += 1
        return idFactory
     }

    // Card's properties
    var identifier: Int
    var number: Int
    var shape: Value
    var fill: Value
    var color: Value
    
    // Initialization the card with ID
    init(number: Int, shape: Value, fill: Value, color: Value) {
        self.identifier = Card.getUniqueIdentifier()
        self.number = number
        self.color = color
        self.shape = shape
        self.fill = fill
    }
    
    //    Implementation of 'Hashable' Protocol
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }

}
