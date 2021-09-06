//
//  GameView.swift
//  Memorize
//
//  Created by Peter Kostin on 2021-09-05.
//

import SwiftUI

struct GameView: View {
    @State var theme: Theme
    @ObservedObject var viewModel: EmojiMemoryGame
    
    init(theme: Theme) {
        self.theme = theme
        viewModel = EmojiMemoryGame(theme: theme)
    }
    
    var body: some View {
        ScrollView {
            Text("Score: \(viewModel.score)")
                .font(.title)

            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(stringToColor(theme.color))
        .padding(.horizontal)
        .navigationBarTitle(theme.name.capitalized)
        .toolbar {
            Button(action: viewModel.newGame) {
                Text("New Game")
            }
        }
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let theme = Theme(name: "flags", emojis: ["🇷🇺", "🇧🇾", "🇰🇿", "🇰🇬", "🇸🇾", "🇨🇳", "🇰🇵", "🇷🇸", "🇫🇷", "🇲🇳", "🇲🇺", "🇨🇦", "🇱🇧", "🇦🇴", "🇲🇿", "🇺🇬", "🇮🇷", "🇨🇺", "🇲🇩", "🇸🇴"], randomPairsOfCards: true, color: "darkPink")
        GameView(theme: theme)
    }
}
