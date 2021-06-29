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
        GeometryReader { geo in
            ScrollView {
                ForEach(game.cards) { card in
                    let cardProperties = game.cardPropertiesDecoder(card.property1, card.property2, card.property3, card.property4)

                    VStack {
                        ClassicSetGameCardView(properties: cardProperties, height: geo.size.height) {
                            switch cardProperties.shape {
                            case .diamond:
                                Diamond()
                                    .fill()
                                    .foregroundColor(cardProperties.color)
                                    .opacity(cardProperties.opacity)
                                Diamond()
                                    .stroke(lineWidth: 5)
                                    .foregroundColor(cardProperties.color)
                            case .oval:
                                Capsule()
                                    .fill()
                                    .foregroundColor(cardProperties.color)
                                    .opacity(cardProperties.opacity)
                                Capsule()
                                    .stroke(lineWidth: 5)
                                    .foregroundColor(cardProperties.color)
                            case .rectangle:
                                Rectangle()
                                    .fill()
                                    .foregroundColor(cardProperties.color)
                                    .opacity(cardProperties.opacity)
                                Rectangle()
                                    .stroke(lineWidth: 5)
                                    .foregroundColor(cardProperties.color)
                            }
                        }
                    }
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
