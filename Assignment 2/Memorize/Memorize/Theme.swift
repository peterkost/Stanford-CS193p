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
}

class Themes {
    let themes = [
        Theme(name: "emojis", emojis: ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊", "😇", "🙂", "🙃", "😉", "😌", "😍", "🥰", "😘", "😗", "😙", "😚", "😋", "😛", "😝"], pairsOfCards: 20, color: "yellow"),
        Theme(name: "transport", emojis: ["✈️", "🚀", "🚗", "🚘", "🚙", "🏎", "🏍", "🚌", "🚐", "🚛", "🛳", "🚑", "🚜", "🚂", "🚄", "🚎", "🛻", "🛴", "🛵", "🚁"], pairsOfCards: 20, color: "blue"),
        Theme(name: "sports", emojis: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🏓", "🎳", "🏸", "🏒", "🏑", "🥍", "🏏", "⛷", "🥊", "🚙", "🏋️‍♀️", "🤺"], pairsOfCards: 20, color: "green"),
        Theme(name: "food", emojis: ["🍔", "🍟", "🍕", "🌮", "🥪", "🥗", "🌯", "🍣", "🥟", "🍤", "🍧", "🍰", "🍪", "🍫", "🥓"], pairsOfCards: 15, color: "red"),
        Theme(name: "flags", emojis: ["🇷🇺", "🇧🇾", "🇰🇿", "🇰🇬", "🇸🇾", "🇨🇳", "🇰🇵", "🇷🇸", "🇫🇷", "🇲🇳", "🇲🇺", "🇨🇦", "🇱🇧", "🇦🇴", "🇲🇿", "🇺🇬", "🇮🇷", "🇨🇺", "🇲🇩", "🇸🇴"], pairsOfCards: 20, color: "darkPink"),
        Theme(name: "animals", emojis: ["🐵", "🐸", "🐭", "🐮", "🦆", "🦇", "🐝", "🦖", "🦞", "🦍"], pairsOfCards: 10, color: "orange")
    ]
    
    func getRandom() -> Theme {
        themes.randomElement()!
    }
}
