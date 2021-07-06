//
//  ClassicSetGame.swift
//  SetGame
//
//  Created by Peter Kostin on 2021-06-29.
//

import SwiftUI

class ClassicSetGame: ObservableObject {
    static func generateCards() -> [SetGame.Card] {
        var cards = [SetGame.Card]()
        for i in SetGame.Property.allCases {
            for j in SetGame.Property.allCases {
                for k in SetGame.Property.allCases {
                    for l in SetGame.Property.allCases {
                        let properties = [i, j, k, l]
                        cards.append(SetGame.Card(properties: properties))
                    }
                }
            }
        }
        return cards
    }
    
    @Published private var model = SetGame(createCards: generateCards)
    
    var cards: [SetGame.Card] {
        model.cards
    }
    
    // if we pass in all cards to AspectVGrid then it will always size them to show 81 cards
    var cardsOnBoard: [SetGame.Card] {
        var res = [SetGame.Card]()
        for card in model.cards where card.location == .onBoard {
            res.append(card)
        }
        return res
    }
    
    var cardsInDeck: [SetGame.Card] {
        var res = [SetGame.Card]()
        for card in model.cards where card.location == .inDeck {
            res.append(card)
        }
        return res
    }
    
    var discardedCards: [SetGame.Card] {
        var res = [SetGame.Card]()
        for card in model.cards where card.location == .discarded {
            res.append(card)
        }
        return res
    }
    
    var deckEmpty: Bool {
        model.deckEmpty
    }
    
    var validSetSelected: Bool? {
        model.validSetSelected
    }
    
    // MARK: - Intent
    
    
    func choose(_ card: SetGame.Card) {
        model.choose(card)
    }
    
    func dealCards() {
        model.dealCards()
    }
    
    func newGame() {
        model = SetGame(createCards: ClassicSetGame.generateCards)
    }
    
    
    func cardPropertiesDecoder(_ properties: [SetGame.Property]) -> CardProperties {
        
        // _ colors: SetGame.Property, _ shapes: SetGame.Property, _ opacities: SetGame.Property, _ counts: SetGame.Property
        var color: Color
        var shape: AnyShape
        var opacity: Double
        var count: Int
        
        switch properties[0] {
        case .a:
            color = .red
        case .b:
            color = .green
        case .c:
            color = .blue
        }
        
        switch properties[1] {
        case .a:
            shape = AnyShape(Rectangle())
        case .b:
            shape = AnyShape(Capsule())
        case .c:
            shape = AnyShape(Diamond())
        }
        
        
        switch properties[2] {
        case .a:
            opacity = 0.0
        case .b:
            opacity = 0.5
        case .c:
            opacity = 1
        }
        
        switch properties[3] {
        case .a:
            count = 1
        case .b:
            count = 2
        case .c:
            count = 3
        }
        
        return CardProperties(color: color, shape: shape, opacity: opacity, count: count)
    }
    
    struct CardProperties {
        let color: Color
        let shape: AnyShape
        let opacity: Double
        let count: Int
    }
}
