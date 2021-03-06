//
 //  ContentView.swift
 //  Memorize
 //
 //  Created by Peter Kostin on 2021-06-25.
 //

 import SwiftUI

 struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
     var body: some View {
        ScrollView {
            Text(viewModel.themeName.capitalized)
                .font(.largeTitle)
            Text("Score: \(viewModel.score)")
                .font(.title)
            Button(action: viewModel.newGame) {
                Text("New Game")
            }
            
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
        .foregroundColor(viewModel.themeColor)
        .padding(.horizontal)
     }

 }

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
        let game = EmojiMemoryGame()
         ContentView(viewModel: game)
     }
 }
