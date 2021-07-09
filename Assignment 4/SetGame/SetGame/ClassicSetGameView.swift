//
//  ClassicSetGameView.swift
//  SetGame
//
//  Created by Peter Kostin on 2021-06-29.
//

import SwiftUI

struct ClassicSetGameView: View {
    @ObservedObject var game: ClassicSetGame
    
    @Namespace private var dealingNamespace
    @State private var dealt = Set<UUID>()
    
    private func deal(_ card: SetGame.Card) {
        dealt.insert(card.id)
    }
    
    private func isUndealt(_ card: SetGame.Card) -> Bool {
        !dealt.contains(card.id)
    }
    
    private func dealAnimation(for card: SetGame.Card) -> Animation {
        var delay = 0.0
        if let index = game.cards.firstIndex(where: { $0.id == card.id }) {
            delay = Double(index) * (Double(2) / Double(game.cards.count))
        }
        return Animation.easeInOut(duration: Double(0.5)).delay(delay)
    }
    
    private func zIndex(of card: SetGame.Card) -> Double {
        -Double(game.cards.firstIndex(where: { $0.id == card.id }) ?? 0)
    }
    
    
    var body: some View {
        VStack {
            AspectVGrid(items: game.cardsOnBoard, aspectRatio: 2/3) { card in
                if isUndealt(card) {
                    Color.clear
                } else {
                    let cardProperties = game.cardPropertiesDecoder(card.properties)
                    ClassicSetGameCardView(card: card, properties: cardProperties, validSetSelected: game.validSetSelected)
                        .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                        .transition(AnyTransition.asymmetric(insertion: .identity, removal: .scale))
                        .zIndex(zIndex(of: card))
                        .onTapGesture {
                            withAnimation {
                                game.choose(card)
                            }
                        }
                }
            }
            
            HStack {
                
                deckBody
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
                    let card = game.discardedCards.last!
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
    
    
    // the body of the deck from which we deal the cards out
    var deckBody: some View {
        ZStack {
            ForEach(game.cardsOnBoard.filter(isUndealt)) { card in
                let cardProperties = game.cardPropertiesDecoder(card.properties)
                ClassicSetGameCardView(card: card, properties: cardProperties, validSetSelected: game.validSetSelected)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
                    .zIndex(zIndex(of: card))
            }
        }
        .frame(width: CGFloat(90), height: CGFloat(90))
        .foregroundColor(Color.red)
        .onTapGesture {
            for card in game.cardsOnBoard {
                withAnimation(dealAnimation(for: card)) {
                    deal(card)
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
