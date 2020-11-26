//
//  ViewController.swift
//  PP2 - Game "Set"
//
//  Created by Михайло Єрошенко on 10.10.2020.
//

import UIKit

class ViewController: UIViewController
{
    // MARK: Initialisations
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIfromModel()

    }
    
    
    // Instance of the game (our model) //
    private lazy var game = Game()
    
    // MARK: Outlets
    @IBOutlet var cardButtons: [CardButton]!
    @IBOutlet weak var matchStatusLabel: UILabel!
    @IBOutlet weak var scoreDisplayLabel: UILabel!
    @IBOutlet weak var numberOfCardsInDeckLabel: UILabel!
    @IBOutlet weak var dealMoreCardsButton: UIButton!
    @IBOutlet weak var cheatButton: UIButton!
    
    // MARK: Actions
    // Touching card action //
    @IBAction func touchCardButton(_ sender: CardButton) {
        // Method works if only button has associated 'Card' instance
        guard let card = sender.card else { return }
        if sender.matchState == .notSet {
            game.chooseCard(card)
            updateUIfromModel()
        }
    }
    
    // Deal 3 more cards //
    @IBAction func dealMoreCards(_ sender: UIButton) {
        game.deal(3)
        updateUIfromModel()
    }
    
    // Starts new game //
    @IBAction func newGame(_ sender: UIButton) {
        game = Game()
        updateUIfromModel()
    }
    
    // Need to be implemented //
    @IBAction func cheat(_ sender: UIButton) {
    }
    
    private func updateUIfromModel() {
        dealMoreCardsButton.backgroundColor = dealMoreCardsButton.isEnabled ? Theme.dealButtonEnabledColor : Theme.dealButtonDisabledColor
        for index in cardButtons.indices {
            let button = cardButtons[index]
            if index < game.cardsInGame.count {
                guard let card = game.cardsInGame[index] else { return }
                button.cardIsSelected = game.selectedCards.contains(card) ? true : false
                if game.matchedCards.contains(card) {
                    button.matchState = .matched
                } else if button.cardIsSelected && game.selectedCards.count == 3 {
                    button.matchState = .notMatched
                } else {
                    button.matchState = .notSet
                }
                button.card = card
            } else {
                button.card = nil
            }
        }
        
        // Enables/disables 'Deal 3 More' button //
        dealMoreCardsButton.isEnabled = !UIIsFull && game.numbederOfCardsInDeck > 0 || (UIIsFull && game.gameMatchState == .matched)
        
        // Shows number of cards in deck //
        numberOfCardsInDeckLabel.text = game.numbederOfCardsInDeck.asString + " in Deck"
        
        // Shows scores of current game //
        scoreDisplayLabel.text = "Score: " + game.score.asString
        
        // Shows if set is matched or not //
        switch game.gameMatchState {
        case .matched:      matchStatusLabel.text = "Matched!"
        case .notMatched:   matchStatusLabel.text = "Not Matched..."
        case .notSet:       matchStatusLabel.text = " "
        }
        // Cheat button is disabled. Reserved for next update with Extra Credit Implementation
        cheatButton.isEnabled = false
    }
}

// MARK: - Extensions
extension ViewController {
    /// - Returns: true if there is no room for new cards in UI.
    var UIIsFull: Bool {
        return self.cardButtons.filter { $0.card != nil }.count == 24
    }
}
extension UIButton {
    open override var isEnabled: Bool {
        didSet {
            self.backgroundColor = self.isEnabled ? Theme.buttonColor : Theme.buttonColorDisabled
        }
    }
}
