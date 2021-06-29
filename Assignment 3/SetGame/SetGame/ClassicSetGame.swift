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
    
    
    func cardPropertiesDecoder(_ colors: SetGame.Property, _ shapes: SetGame.Property, _ opacities: SetGame.Property, _ counts: SetGame.Property) -> CardProperties {
        var color: Color
        var shape: AnyShape
        var opacity: Double
        var count: Int
        
        switch colors {
        case .a:
            color = .red
        case .b:
            color = .green
        case .c:
            color = .blue
        }
        
        switch shapes {
        case .a:
            shape = AnyShape(Rectangle())
        case .b:
            shape = AnyShape(Capsule())
        case .c:
            shape = AnyShape(Diamond())
        }
        
        
        switch opacities {
        case .a:
            opacity = 0.0
        case .b:
            opacity = 0.5
        case .c:
            opacity = 1
        }
        
        switch counts {
        case .a:
            count = 1
        case .b:
            count = 2
        case .c:
            count = 3
        }
        
        return CardProperties(color: color, shape: shape, opacity: opacity, count: count)
    }
    
    struct CardProperties {
        let color: Color
        let shape: AnyShape
        let opacity: Double
        let count: Int
    }
}
