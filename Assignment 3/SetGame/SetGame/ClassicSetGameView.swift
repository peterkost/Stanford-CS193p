//
//  ClassicSetGameView.swift
//  SetGame
//
//  Created by Peter Kostin on 2021-06-29.
//

import SwiftUI

struct ClassicSetGameView: View {
    @ObservedObject var game: ClassicSetGame
    
    var body: some View {
        ScrollView {
            ForEach(game.cards) { card in
                let cardProperties = game.cardPropertiesDecoder(card.property1, card.property2, card.property3, card.property4)
                
                ClassicSetGameCardView(properties: cardProperties)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ClassicSetGameView(game: ClassicSetGame())
    }
}
