//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Peter Kostin on 2021-06-26.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    private var theme: Theme
//    @Published private(set) var themeColor: Color
//    @Published private(set) var themeName: String
    
    init(theme: Theme) {
        self.theme = theme
        let pairsOfCards = theme.pairsOfCards > theme.emojis.count ? theme.emojis.count : theme.pairsOfCards
        let emojis = theme.emojis.shuffled() // this shuffle makes sure that the used cards are random if pairsOfCards < theme.emojis.count
        model = MemoryGame<String>(numberOfPairsOfCards: pairsOfCards) { pairIndex in emojis[pairIndex] }
//        themeColor = EmojiMemoryGame.stringToColor(theme.color)
//        themeName = theme.name
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    
    // MARK: - Intent
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        let pairsOfCards = theme.pairsOfCards > theme.emojis.count ? theme.emojis.count : theme.pairsOfCards
        let emojis = theme.emojis.shuffled() // this shuffle makes sure that the used cards are random if pairsOfCards < theme.emojis.count
        model = MemoryGame<String>(numberOfPairsOfCards: pairsOfCards) { pairIndex in emojis[pairIndex] }
//        themeColor = EmojiMemoryGame.stringToColor(theme.color)
//        themeName = theme.name
    }
    
}
