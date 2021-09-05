//
 //  ContentView.swift
 //  Memorize
 //
 //  Created by Peter Kostin on 2021-06-25.
 //

 import SwiftUI

 struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    @ObservedObject var themeStore: ThemeStore
    
    @State private var selectedTheme: Theme? {
        didSet {
            viewModel.newGame(theme: selectedTheme!)
        }
    }
    
     var body: some View { 
        
        if viewModel.activeGame {
            ScrollView {
                Text(selectedTheme!.name.capitalized)
                    .font(.largeTitle)
                Text("Score: \(viewModel.score)")
                    .font(.title)
//                Button(action: viewModel.newGame(theme: selectedTheme!)) {
//                    Text("New Game")
//                }
                
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
//            .foregroundColor(viewModel.themeColor)
            .padding(.horizontal)
        } else {
            themeSelect
        }
     }
    
    var themeSelect: some View {
        List {
            ForEach(themeStore.themes) { theme in
                VStack {
                    Text(theme.name)
                    Text("\(theme.emojis.joined())")
                }
                .onTapGesture {
                    selectedTheme = theme
                }
            }
        }
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

// struct ContentView_Previews: PreviewProvider {
//     static var previews: some View {
//        let game = EmojiMemoryGame()
//         ContentView(viewModel: game)
//     }
// }
