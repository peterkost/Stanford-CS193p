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
    
    var opacity: Double {
        if card.isSelected {
            if validSetSelected != nil {
                    return 0.5
            }
        }
        return 0
    }
    
    
    var body: some View {
        let cardShape = RoundedRectangle(cornerRadius: CardConstants.cornerRadius)
        ZStack {
            GeometryReader { geo in
                ZStack {
                    cardShape
                        .fill()
                        .foregroundColor(.white)
                    
                    if card.isSelected {
                        cardShape
                            .strokeBorder(lineWidth: CardConstants.selectedLineWidth)
                            .foregroundColor(CardConstants.selectedCardColor)
                    } else {
                        cardShape
                            .strokeBorder(lineWidth: CardConstants.standardLineWidth)
                    }
                    
                    VStack {
                        ForEach(0..<properties.count, id: \.self) { _ in
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
                    
                    // colors selected set red/green
                    cardShape
                        .fill()
                        .foregroundColor(validSetSelected == nil ? .clear : validSetSelected! ? .green : .red)
                        .opacity(opacity)
                        .animation(validSetSelected == nil ? Animation.easeInOut(duration: 0) : Animation.easeInOut(duration: 1).repeatForever())

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
