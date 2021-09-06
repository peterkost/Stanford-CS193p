//
//  ColorConverter.swift
//  Memorize
//
//  Created by Peter Kostin on 2021-09-06.
//

import SwiftUI

func stringToColor(_ colorName: String) -> Color {
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
