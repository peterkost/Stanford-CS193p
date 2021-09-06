//
//  Theme.swift
//  Memorize
//
//  Created by Peter Kostin on 2021-06-27.
//

import Foundation

struct Theme: Codable, Identifiable {
    let name: String
    let emojis: [String]
    let pairsOfCards: Int
    let color: String
    private(set) var id = UUID().uuidString
    
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

class ThemeStore: ObservableObject {
    @Published var activeTheme: Theme?
    
    @Published var themes = [Theme]() {
        didSet {
            saveToUserDefaults()
        }
    }
    
    init() {
        loadFromUserDefaults()
        if themes.isEmpty {
            themes = defaultThemes
        }
    }
    
    // MARK: - Loading and Saving
    
    private var userDefaultsKey = "ThemeStore"
    
    private func loadFromUserDefaults() {
        if let jsonData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decodedThemes = try? JSONDecoder().decode([Theme].self, from: jsonData) {
            themes = decodedThemes
        }
    }
    
    private func saveToUserDefaults() {
        UserDefaults.standard.set(try? JSONEncoder().encode(themes), forKey: userDefaultsKey)
    }

    
    // MARK: - Intent
    
    func selectRandomTheme() {
        activeTheme = themes.randomElement()!
    }
    
    func addTheme(name: String, emojis: [String], pairsOfCards: Int? = nil, randomPairsOfCards: Bool = false, color: String) {
        let newTheme = Theme(name: name, emojis: emojis, pairsOfCards: pairsOfCards, randomPairsOfCards: randomPairsOfCards, color: color)
        themes.append(newTheme)
    }
    
    func getThemeWithID(_ id: String) -> Theme {
        themes.first(where: { $0.id == id })!
    }
    
}

fileprivate let defaultThemes = [
    Theme(name: "emojis", emojis: ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊", "😇", "🙂", "🙃", "😉", "😌", "😍", "🥰", "😘", "😗", "😙", "😚", "😋", "😛", "😝"], pairsOfCards: 20, color: "yellow"),
    Theme(name: "transport", emojis: ["✈️", "🚀", "🚗", "🚘", "🚙", "🏎", "🏍", "🚌", "🚐", "🚛", "🛳", "🚑", "🚜", "🚂", "🚄", "🚎", "🛻", "🛴", "🛵", "🚁"], color: "blue"),
    Theme(name: "sports", emojis: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🏓", "🎳", "🏸", "🏒", "🏑", "🥍", "🏏", "⛷", "🥊", "🚙", "🏋️‍♀️", "🤺"], pairsOfCards: 20, color: "green"),
    Theme(name: "food", emojis: ["🍔", "🍟", "🍕", "🌮", "🥪", "🥗", "🌯", "🍣", "🥟", "🍤", "🍧", "🍰", "🍪", "🍫", "🥓"], pairsOfCards: 15, color: "red"),
    Theme(name: "flags", emojis: ["🇷🇺", "🇧🇾", "🇰🇿", "🇰🇬", "🇸🇾", "🇨🇳", "🇰🇵", "🇷🇸", "🇫🇷", "🇲🇳", "🇲🇺", "🇨🇦", "🇱🇧", "🇦🇴", "🇲🇿", "🇺🇬", "🇮🇷", "🇨🇺", "🇲🇩", "🇸🇴"], randomPairsOfCards: true, color: "darkPink"),
    Theme(name: "animals", emojis: ["🐵", "🐸", "🐭", "🐮", "🦆", "🦇", "🐝", "🦖", "🦞", "🦍"], pairsOfCards: 10, color: "orange")
]
