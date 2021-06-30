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
    let validSetSelected: Bool?
    
    
    var body: some View {
        let cardShape = RoundedRectangle(cornerRadius: 10)
        ZStack {
            GeometryReader { geo in
                ZStack {
                    cardShape
                        .fill()
                        .foregroundColor(.white)
                    
                    if card.isSelected {
                        if let setSelected = validSetSelected {
                            if setSelected {
                                cardShape
                                    .strokeBorder(lineWidth: 5)
                                    .foregroundColor(.green)
                            } else {
                                cardShape
                                    .strokeBorder(lineWidth: 5)
                                    .foregroundColor(.red)
                            }
                            
                        } else {
                            cardShape
                                .strokeBorder(lineWidth: 5)
                                .foregroundColor(.yellow)
                        }
                        
                    } else {
                        cardShape
                            .strokeBorder(lineWidth: 3)
                    }
                    
                    VStack {
                        // ForEach(0..<properties.count) was causing issues when scrolling and starting a new game.
                        // Couldn't fix it so I just hard coded the three shapes
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
                        
                        if properties.count == 2 {
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
                        
                        if properties.count == 3 {
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

//struct ClassicSetGameCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        let props = ClassicSetGame.CardProperties(color: Color.red, shape: AnyShape(Rectangle()), opacity: 1, count: 2)
//        ClassicSetGameCardView(properties: props)
//    }
//}
