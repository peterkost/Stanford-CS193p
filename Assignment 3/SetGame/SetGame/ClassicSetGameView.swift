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
        VStack {
            AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
                let cardProperties = game.cardPropertiesDecoder(card.property1, card.property2, card.property3, card.property4)
                ClassicSetGameCardView(card: card, properties: cardProperties, validSetSelected: game.validSetSelected)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
            
            if !game.deckEmpty {
                Button("Deal 3") {
                    game.dealCards()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ClassicSetGameView(game: ClassicSetGame())
    }
}
