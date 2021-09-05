//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Peter Kostin on 2021-06-26.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    @Published private(set) var themeColor: Color
    @Published private(set) var themeName: String
    
    init() {
        let theme = Themes().getRandom()
        let pairsOfCards = theme.pairsOfCards > theme.emojis.count ? theme.emojis.count : theme.pairsOfCards
        let emojis = theme.emojis.shuffled() // this shuffle makes sure that the used cards are random if pairsOfCards < theme.emojis.count
        model = MemoryGame<String>(numberOfPairsOfCards: pairsOfCards) { pairIndex in emojis[pairIndex] }
        themeColor = EmojiMemoryGame.stringToColor(theme.color)
        themeName = theme.name
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
        let theme = Themes().getRandom()
        let pairsOfCards = theme.pairsOfCards > theme.emojis.count ? theme.emojis.count : theme.pairsOfCards
        let emojis = theme.emojis.shuffled() // this shuffle makes sure that the used cards are random if pairsOfCards < theme.emojis.count
        model = MemoryGame<String>(numberOfPairsOfCards: pairsOfCards) { pairIndex in emojis[pairIndex] }
        themeColor = EmojiMemoryGame.stringToColor(theme.color)
        themeName = theme.name
    }
    
    // MARK: - Helpers
    
    static func stringToColor(_ colorName: String) -> Color {
        switch colorName {
        case "black":
            return Color.black
        case "blue":
            return Color.blue
        case "gray":
            return Color.gray
        case "green":
            return Color.green
        case "orange":
            return Color.orange
        case "pink":
            return Color.pink
        case "yellow":
            return Color.yellow
        case "purple":
            return Color.purple
        case "red":
            return Color.red
        case "darkPink":
            return Color(red: 231 / 255, green: 84 / 255, blue: 128 / 255)
        default:
            return Color(red: 134 / 255, green: 44 / 255, blue: 96 / 255)
        }
    }
}
