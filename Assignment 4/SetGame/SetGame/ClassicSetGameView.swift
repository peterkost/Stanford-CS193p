//
//  ClassicSetGameView.swift
//  SetGame
//
//  Created by Peter Kostin on 2021-06-29.
//

import SwiftUI

struct ClassicSetGameView: View {
    @ObservedObject var game: ClassicSetGame
    @State private var lastTouchedCard: SetGame.Card?
    
    var body: some View {
        VStack {
            AspectVGrid(items: game.cardsOnBoard, aspectRatio: 2/3) { card in
                let cardProperties = game.cardPropertiesDecoder(card.properties)
                ClassicSetGameCardView(card: card, properties: cardProperties, validSetSelected: game.validSetSelected)
                    .onTapGesture {
                        withAnimation {
                            game.choose(card)

                        }
                    }
            }
            
            HStack {
                if !game.deckEmpty {
                    RoundedRectangle(cornerRadius: 10)
                        .aspectRatio(2/3, contentMode: .fit)
                        .foregroundColor(.yellow)
                        .onTapGesture {
                            withAnimation {
                                game.dealCards()
                            }
                        }
                }
                
                if !game.discardedCards.isEmpty {
                    let card = game.discardedCards[0]
                    let cardProperties = game.cardPropertiesDecoder(card.properties)
                    ClassicSetGameCardView(card: card, properties: cardProperties, validSetSelected: game.validSetSelected)
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
            .frame(height: 150)
            
            Button("New Game") {
                game.newGame()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ClassicSetGameView(game: ClassicSetGame())
    }
}
