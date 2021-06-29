//
//  ClassicSetGame.swift
//  SetGame
//
//  Created by Peter Kostin on 2021-06-29.
//

import SwiftUI

class ClassicSetGame: ObservableObject {
    @Published private var model = SetGame()
    
    var cards: [SetGame.Card] {
        model.cards
    }
    
    
    func cardPropertiesToView(property1 color: SetGame.Property, property2 shape: SetGame.Property, property3 fill: SetGame.Property, property4 count: SetGame.Property) -> String {
        var res = ""
        
        switch color {
        case .a:
            res += "red "
        case .b:
            res += "green "
        case .c:
            res += "blue "
        }
        
        switch shape {
        case .a:
            res += "rectangle"
        case .b:
            res += "diamond"
        case .c:
            res += " oval"
        }
        
        switch fill {
        case .a:
            res += "clear "
        case .b:
            res += "half "
        case .c:
            res += " full "
        }
        
        switch count {
        case .a:
            res += " one"
        case .b:
            res += " two"
        case .c:
            res += " three"
        }
        
        return res
    }
}
