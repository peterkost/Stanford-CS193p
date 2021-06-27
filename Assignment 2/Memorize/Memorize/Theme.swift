//
//  Theme.swift
//  Memorize
//
//  Created by Peter Kostin on 2021-06-27.
//

import Foundation

struct Theme {
    let name: String
    let emojis: [String]
    let pairsOfCards: Int
    let color: String
    
    init(name: String, emojis: [String], pairsOfCards: Int? = nil, randomPairsOfCards: Bool = false, color: String) {
        self.name = name
        self.emojis = emojis
        if randomPairsOfCards {
            self.pairsOfCards = Int.random(in: 8..<emojis.count)
        } else {
            self.pairsOfCards = pairsOfCards ?? emojis.count
        }
        self.color = color
    }
}

class Themes {
    let themes = [
        Theme(name: "emojis", emojis: ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊", "😇", "🙂", "🙃", "😉", "😌", "😍", "🥰", "😘", "😗", "😙", "😚", "😋", "😛", "😝"], pairsOfCards: 20, color: "yellow"),
        Theme(name: "transport", emojis: ["✈️", "🚀", "🚗", "🚘", "🚙", "🏎", "🏍", "🚌", "🚐", "🚛", "🛳", "🚑", "🚜", "🚂", "🚄", "🚎", "🛻", "🛴", "🛵", "🚁"], color: "blue"),
        Theme(name: "sports", emojis: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🏓", "🎳", "🏸", "🏒", "🏑", "🥍", "🏏", "⛷", "🥊", "🚙", "🏋️‍♀️", "🤺"], pairsOfCards: 20, color: "green"),
        Theme(name: "food", emojis: ["🍔", "🍟", "🍕", "🌮", "🥪", "🥗", "🌯", "🍣", "🥟", "🍤", "🍧", "🍰", "🍪", "🍫", "🥓"], pairsOfCards: 15, color: "red"),
        Theme(name: "flags", emojis: ["🇷🇺", "🇧🇾", "🇰🇿", "🇰🇬", "🇸🇾", "🇨🇳", "🇰🇵", "🇷🇸", "🇫🇷", "🇲🇳", "🇲🇺", "🇨🇦", "🇱🇧", "🇦🇴", "🇲🇿", "🇺🇬", "🇮🇷", "🇨🇺", "🇲🇩", "🇸🇴"], randomPairsOfCards: true, color: "darkPink"),
        Theme(name: "animals", emojis: ["🐵", "🐸", "🐭", "🐮", "🦆", "🦇", "🐝", "🦖", "🦞", "🦍"], pairsOfCards: 10, color: "orange")
    ]
    
    func getRandom() -> Theme {
        themes.randomElement()!
    }
}
