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
        Theme(name: "emojis", emojis: ["ð", "ð", "ð", "ð", "ð", "ð", "ð", "ðĪĢ", "ðĨē", "âšïļ", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ðĨ°", "ð", "ð", "ð", "ð", "ð", "ð", "ð"], pairsOfCards: 20, color: "yellow"),
        Theme(name: "transport", emojis: ["âïļ", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ðģ", "ð", "ð", "ð", "ð", "ð", "ðŧ", "ðī", "ðĩ", "ð"], color: "blue"),
        Theme(name: "sports", emojis: ["â―ïļ", "ð", "ð", "âūïļ", "ðĨ", "ðū", "ð", "ð", "ð", "ðģ", "ðļ", "ð", "ð", "ðĨ", "ð", "â·", "ðĨ", "ð", "ðïļââïļ", "ðĪš"], pairsOfCards: 20, color: "green"),
        Theme(name: "food", emojis: ["ð", "ð", "ð", "ðŪ", "ðĨŠ", "ðĨ", "ðŊ", "ðĢ", "ðĨ", "ðĪ", "ð§", "ð°", "ðŠ", "ðŦ", "ðĨ"], pairsOfCards: 15, color: "red"),
        Theme(name: "flags", emojis: ["ð·ðš", "ð§ðū", "ð°ðŋ", "ð°ðŽ", "ðļðū", "ðĻðģ", "ð°ðĩ", "ð·ðļ", "ðŦð·", "ðēðģ", "ðēðš", "ðĻðĶ", "ðąð§", "ðĶðī", "ðēðŋ", "ðšðŽ", "ðŪð·", "ðĻðš", "ðēðĐ", "ðļðī"], randomPairsOfCards: true, color: "darkPink"),
        Theme(name: "animals", emojis: ["ðĩ", "ðļ", "ð­", "ðŪ", "ðĶ", "ðĶ", "ð", "ðĶ", "ðĶ", "ðĶ"], pairsOfCards: 10, color: "orange")
    ]
    
    func getRandom() -> Theme {
        themes.randomElement()!
    }
}
