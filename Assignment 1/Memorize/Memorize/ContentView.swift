//
//  ContentView.swift
//  Memorize
//
//  Created by Peter Kostin on 2021-06-25.
//

import SwiftUI

struct ContentView: View {
    
    let themes = [
        "emojis":["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊", "😇", "🙂", "🙃", "😉", "😌", "😍", "🥰", "😘", "😗", "😙", "😚", "😋", "😛", "😝"],
        "transport":["✈️", "🚀", "🚗", "🚘", "🚙", "🏎", "🏍", "🚌", "🚐", "🚛", "🛳", "🚑", "🚜", "🚂", "🚄", "🚎", "🛻", "🛴", "🛵", "🚁"],
        "sports": ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🏓", "🎳", "🏸", "🏒", "🏑", "🥍", "🏏", "⛷", "🥊", "🚙", "🏋️‍♀️", "🤺"]]
    @State var selectedTheme = "emojis"
    var emojiCount: Int {
        Int.random(in: 10...themes[selectedTheme]!.count)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                Text("Memorize!")
                    .font(.largeTitle)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(themes[selectedTheme]![0..<emojiCount].shuffled(), id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                Spacer()
                
                VStack {
                    Image(systemName: "face.smiling")
                        .font(.largeTitle)
                    Text("Faces")
                        .font(.subheadline)
                }
                .onTapGesture { selectedTheme = "emojis" }
                
                Spacer()
                
                VStack {
                    Image(systemName: "car")
                        .font(.largeTitle)
                    Text("Transport")
                        .font(.subheadline)
                }
                .onTapGesture { selectedTheme = "transport" }
                
                Spacer()
                
                VStack {
                    Image(systemName: "sportscourt")
                        .font(.largeTitle)
                    Text("Sports")
                        .font(.subheadline)
                }
                .onTapGesture { selectedTheme = "sports" }
                
                Spacer()
                
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture { isFaceUp = !isFaceUp}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
