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
                    VStack(alignment: .leading) {
                        HStack {
                            Text(theme.name.capitalized)
                                .foregroundColor(stringToColor(theme.color))
                                .font(.title2)
                            
                            Spacer()
                            
                            Text("\(EmojiMemoryGame.truePairCountIn(theme: theme)) pairs of cards")
                        }

                        Text("\(theme.emojis.joined())")
                            .lineLimit(1)
                            .font(.title2)
                    }
                }

            }
        }
        .navigationBarTitle("Memorize")
        .navigationBarItems(
            leading: EditButton(),
            trailing: Button(action: { print("xd")
            }) {
                Image(systemName: "plus")
            })
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
        let themeStore = ThemeStore()
        ContentView(themeStore: themeStore)
     }
 }
