//
//  Themes.swift
//  Memorize
//
//  Created by Peter Kostin on 2021-05-15.
//

import SwiftUI

struct Theme {
    var name: String
    var content: [String]
    var numCards: Int?
    var backgroundColor: Color
}

let themes: [Theme] = [
    Theme(
        name: "Halloween",
        content: ["👻", "🎃", "🕷", "☠️", "🧟", "🪦", "🦇", "👹", "👽", "🐍", "🦸", "🕸"],
        numCards: 3,
        backgroundColor: .orange),
    Theme(
        name: "Flags",
        content: ["🇷🇺", "🇨🇳", "🇻🇳", "🇮🇶", "🇰🇵", "🇧🇾", "🇨🇺", "🇵🇸", "🇦🇫", "🇸🇾", "🇱🇾", "🇻🇪"],
        backgroundColor: .blue),
    Theme(
        name: "Food",
        content: ["🍔", "🌭", "🌮", "🌯", "🥓", "🍛", "🥞", "🍩", "🍫", "🍱", "🥟", "🍰"],
        numCards: 6,
        backgroundColor: .red),
    Theme(
        name: "Sports",
        content: ["⚽️", "🏀", "🏈", "⚾️", "🎱", "🏓", "🏸", "🥊", "🥋", "⛸", "🏏", "⛳️"],
        numCards: 9,
        backgroundColor: .green),
    Theme(
        name: "Faces",
        content: ["😀", "😆", "😍", "😎", "😟", "😔", "🥳", "🧐", "🤬", "😱", "😶‍🌫️", "😫"],
        numCards: 9,
        backgroundColor: .yellow),
    Theme(
        name: "Transportation",
        content: ["🏎", "🚗", "🚌", "🚟", "🚝", "🚅", "✈️", "🚀", "⛵️", "🚁", "🛸", "🚂"],
        numCards: 12,
        backgroundColor: .black),
        
]
