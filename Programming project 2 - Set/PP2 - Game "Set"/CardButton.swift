//
//  CardButton.swift
//  PP2 - Game "Set"
//
//  Created by Михайло Єрошенко on 11.10.2020.
//

import Foundation
import UIKit

class CardButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    // Card, assigned to button //
    var card: Card? {
        didSet {
            self.updateState()
        }
    }
    
    // Returns 'true' if card is selected, by default all the cards are not selected //
    var cardIsSelected: Bool   = false
    
    /// Returns  of type 'MatchState';
    /// Can be in one of three states:
    /// .matched, if card is matched;
    /// .notMatched, if not;
    /// .notSet, if no cards to test for matching
    var matchState: Game.MatchState = .notSet {
        didSet {
            switch matchState {
            case .matched:
                self.layer.borderColor = Theme.cardColorMatched.cgColor
                self.layer.borderWidth = CGFloat(3.0)
            case .notMatched:
                self.layer.borderColor = Theme.cardColorNotMatched.cgColor
                self.layer.borderWidth = CGFloat(3.0)
            case .notSet:
                self.layer.borderWidth = CGFloat(0.0)
            }
        }
    }
    
    func updateState() {
        if let card = self.card {
            self.isEnabled = true
            
            let shape       = cardShapes[card.shape]
            let shapesArray = Array(repeating: shape, count: card.number)
            let color       = cardColors[card.color]
            let fill        = cardFills[card.fill]
            let font        = UIFont.systemFont(ofSize: 23.0)
            
            let attributes: [NSAttributedString.Key: Any] = [
                .font           : font,
                .strokeWidth    : -10.0,
                .strokeColor    : color,
                .foregroundColor: color.withAlphaComponent(fill)
            ]
            let attributedString = NSAttributedString(string: shapesArray.joined(separator: "\n"), attributes: attributes)
            setAttributedTitle(attributedString, for: .normal)
            self.backgroundColor   = cardIsSelected ? Theme.cardColorSelected.withAlphaComponent(0.5) : Theme.cardColor
        } else {
            self.isEnabled         = false
            self.cardIsSelected    = false
            self.matchState        = .notSet
            self.backgroundColor   = Theme.backgroundColor
            self.setAttributedTitle(nil, for: .normal)
            self.setTitle("", for: .normal)
            
        }
        
    }
    
    func configure() {
        updateState()
        layer.backgroundColor = Theme.cardColor.cgColor
        layer.cornerRadius = Theme.cardButtonCornerRadius
    }
    
    private let cardShapes            = ["▲", "●", "■"]
    private let cardColors: [UIColor] = [#colorLiteral(red: 0, green: 0.8319596052, blue: 0, alpha: 1), #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)]
    private let cardFills : [CGFloat] = [1.0, 0.5, 0.1]
    
}


extension Array {
    subscript(_ value: Card.Value) -> Element {
        return self[(value.rawValue - 1)]
    }
}
