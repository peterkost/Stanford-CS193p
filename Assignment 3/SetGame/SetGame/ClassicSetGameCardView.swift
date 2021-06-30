//
//  ClassicSetGameCardView.swift
//  SetGame
//
//  Created by Peter Kostin on 2021-06-29.
//

import SwiftUI

struct ClassicSetGameCardView: View {
    let card: SetGame.Card
    let properties: ClassicSetGame.CardProperties
    
    
    var body: some View {
        if card.location == .onBoard {
            let cardShape = RoundedRectangle(cornerRadius: 10)
            ZStack {
                GeometryReader { geo in
                    ZStack {
                        cardShape
                            .fill()
                            .foregroundColor(.white)

                        if card.isSelected {
                            cardShape
                                .strokeBorder(lineWidth: 5)
                                .foregroundColor(.yellow)
                        } else {
                            cardShape
                                .strokeBorder(lineWidth: 3)
                        }

                        VStack {
                            ForEach(0..<properties.count) { _ in
                                ZStack {
                                    properties.shape
                                        .fill()
                                        .foregroundColor(properties.color)
                                        .opacity(properties.opacity)
                                        .aspectRatio(2/1, contentMode: .fit)
                                    properties.shape
                                        .stroke(lineWidth: 3)
                                        .foregroundColor(properties.color)
                                        .aspectRatio(2/1, contentMode: .fit)
                                }
                                .frame(height: geo.size.height / 6)
                            }
                        }
                    }
                }
            }
        }
    }
}

//struct ClassicSetGameCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        let props = ClassicSetGame.CardProperties(color: Color.red, shape: AnyShape(Rectangle()), opacity: 1, count: 2)
//        ClassicSetGameCardView(properties: props)
//    }
//}
