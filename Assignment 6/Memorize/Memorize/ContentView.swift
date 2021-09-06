//
 //  ContentView.swift
 //  Memorize
 //
 //  Created by Peter Kostin on 2021-06-25.
 //

 import SwiftUI

 struct ContentView: View {
    @ObservedObject var themeStore: ThemeStore
    
     var body: some View {
        NavigationView {
            themeSelect
        }
     }
    
    var themeSelect: some View {
        List {
            ForEach(themeStore.themes) { theme in
                NavigationLink(destination: GameView(theme: theme)) {
                    VStack {
                        Text(theme.name)
                        Text("\(theme.emojis.joined())")
                    }
                }

            }
        }
        .navigationBarTitle("Memorize")
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
