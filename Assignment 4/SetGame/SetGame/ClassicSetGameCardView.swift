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
        let cardShape = RoundedRectangle(cornerRadius: CardConstants.cornerRadius)
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
                                    .strokeBorder(lineWidth: CardConstants.selectedLineWidth)
                                    .foregroundColor(CardConstants.selectedSetColor)
                            } else {
                                cardShape
                                    .strokeBorder(lineWidth: CardConstants.selectedLineWidth)
                                    .foregroundColor(CardConstants.selectedInvalidSetColor)
                            }
                            
                        } else {
                            cardShape
                                .strokeBorder(lineWidth: CardConstants.selectedLineWidth)
                                .foregroundColor(CardConstants.selectedCardColor)
                        }
                        
                    } else {
                        cardShape
                            .strokeBorder(lineWidth: CardConstants.standardLineWidth)
                    }
                    
                    VStack {
                        // ForEach(0..<properties.count) was causing issues when scrolling and starting a new game.
                        // Couldn't fix it so I just hard coded the three shapes
                        ZStack {
                            properties.shape
                                .fill()
                                .foregroundColor(properties.color)
                                .opacity(properties.opacity)
                                .aspectRatio(CardConstants.contentAspectRatio, contentMode: .fit)
                            properties.shape
                                .stroke(lineWidth: CardConstants.standardLineWidth)
                                .foregroundColor(properties.color)
                                .aspectRatio(CardConstants.contentAspectRatio, contentMode: .fit)
                        }
                        .frame(height: geo.size.height / CardConstants.frameScale)
                        
                        if properties.count == 2 {
                            ZStack {
                                properties.shape
                                    .fill()
                                    .foregroundColor(properties.color)
                                    .opacity(properties.opacity)
                                    .aspectRatio(CardConstants.contentAspectRatio, contentMode: .fit)
                                properties.shape
                                    .stroke(lineWidth: CardConstants.standardLineWidth)
                                    .foregroundColor(properties.color)
                                    .aspectRatio(CardConstants.contentAspectRatio, contentMode: .fit)
                            }
                            .frame(height: geo.size.height / CardConstants.frameScale)
                        }
                        
                        if properties.count == 3 {
                            ZStack {
                                properties.shape
                                    .fill()
                                    .foregroundColor(properties.color)
                                    .opacity(properties.opacity)
                                    .aspectRatio(CardConstants.contentAspectRatio, contentMode: .fit)
                                properties.shape
                                    .stroke(lineWidth: CardConstants.standardLineWidth)
                                    .foregroundColor(properties.color)
                                    .aspectRatio(CardConstants.contentAspectRatio, contentMode: .fit)
                            }
                            .frame(height: geo.size.height / CardConstants.frameScale)
                        }
                    }
                }
            }
        }
    }
    
    
    private struct CardConstants {
        static let cornerRadius: CGFloat = 10
        static let selectedLineWidth: CGFloat = 5
        static let standardLineWidth: CGFloat = 3
        static let contentAspectRatio: CGFloat = 2/1
        static let frameScale: CGFloat = 6
        static let selectedCardColor: Color = .yellow
        static let selectedSetColor: Color = .green
        static let selectedInvalidSetColor: Color = .red
    }
}

//struct ClassicSetGameCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        let props = ClassicSetGame.CardProperties(color: Color.red, shape: AnyShape(Rectangle()), opacity: 1, count: 2)
//        ClassicSetGameCardView(properties: props)
//    }
//}
