//
//  Deck.swift
//  PP2 - Game "Set"
//
//  Created by Михайло Єрошенко on 10.10.2020.
//

import Foundation


struct Deck {
    
    //    MARK: - Public API
        
        // Deck of cards
        var cards: [Card]
        
        // Returns number of cards in deck
        var count: Int { return self.cards.count }

        //     MARK: - Initializations
        init() {
            // Initializing 'deck' with 81 'Card's.
            self.cards = Deck.create()
        }
        
        //    MARK: - Creating Deck
        ///    Creates an Array of 'Card's.
        /// - Returns: Shuffled array of 'Card's.
        private static func create() ->[Card] {
            let attributes = Deck.attributesForCardsWithOptions([Card.Value.v1, Card.Value.v2, Card.Value.v3], count: 4)
            return attributes.map { Card(number: $0[0].rawValue, shape: $0[1], fill: $0[3], color: $0[2]) }.shuffled()
        }
    
    
        
        ///    Creates an array of arrays [[1, 2, 3, 4]...] with the values of the cards attributes;
        ///    where 1st element of inner array - number of figures, 2nd - shape etc.
        ///    - Parameters:
        ///      - Options: array of permissible attribute values;
        ///        for example, for the attribute 'color' it might be - 1 - blue, 2 - purple, 3 - red)
        ///      - count: number of attributes of 'Card' (number, shape, color, fill).
        ///    - Returns: Array of arrays with attribute values for cards [[1, 1, 1, 1] ... [3, 3, 3, 3]].
        private static func attributesForCardsWithOptions<T>(_ options: [T], count: Int) -> [[T]] {
            guard options.count >= 0 && count > 0 else { return [[]] }
            var permutations = [[T]]()
            for option in options {
                permutations += attributesForCardsWithOptions(options, count: count - 1).map {[option] + $0}
            }
            return permutations
        }
    
  
}
