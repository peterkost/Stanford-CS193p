//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Peter Kostin on 2021-05-08.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text(viewModel.themeName)
                .font(.largeTitle)
            Text("Score: \(viewModel.score)")
                .font(.title2)
            Button("New Game") {
                viewModel.newGame()
            }
            Grid(viewModel.cards) {  card in
                CardView(card: card, themeColor: viewModel.cardBackColor).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
            .padding()
            .foregroundColor(viewModel.cardBackColor)
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var themeColor: Color
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.white, themeColor]), startPoint: .top, endPoint: .bottom)
)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                if !card.isMatched{
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
        }
        //.aspectRatio(CGSize(width: 2, height: 3), contentMode: .fit)
        .padding(5)
        .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
