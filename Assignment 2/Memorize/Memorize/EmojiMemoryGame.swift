//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Peter Kostin on 2021-05-08.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    
    var theme = themes.randomElement()!
    
    init() {
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        let emojis: Array<String> = theme.content.shuffled()
        // if numCards is not specified then a random number from 2 to the length of the content is chosen
        return MemoryGame<String>(numberOfPairsOfCards: theme.numCards != nil ? theme.numCards! : Int.random(in: 2..<emojis.count)) { pairIndex in
            return emojis[pairIndex]
         }
    }
        
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var cardBackColor: Color {
        theme.backgroundColor
    }
    
    var themeName: String {
        theme.name
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func newGame() {
        self.theme = themes.randomElement()!
        self.model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
