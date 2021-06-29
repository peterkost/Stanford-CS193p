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
                Text(game.cardPropertiesToView(property1: card.property1, property2: card.property2, property3: card.property3, property4: card.property4))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ClassicSetGameView(game: ClassicSetGame())
    }
}
