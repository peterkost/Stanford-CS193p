//
//  ClassicSetGameCardView.swift
//  SetGame
//
//  Created by Peter Kostin on 2021-06-29.
//

import SwiftUI

struct ClassicSetGameCardView: View {
    let properties: ClassicSetGame.CardProperties
    let height: CGFloat

    
    var body: some View {
        let cardShape = RoundedRectangle(cornerRadius: 20)
        
        
        ZStack {
            cardShape
                .fill()
                .foregroundColor(.white)
            
            // going to change this color when card is selected
            cardShape
                .strokeBorder(lineWidth: 3)
            VStack {
            ForEach(0..<properties.count) { _ in
                ZStack {
                    switch properties.shape {
                    case .diamond:
                        Diamond()
                            .fill()
                            .foregroundColor(properties.color)
                            .opacity(properties.opacity)
                        Diamond()
                            .stroke(lineWidth: 5)
                            .foregroundColor(properties.color)
                    case .oval:
                        Capsule()
                            .fill()
                            .foregroundColor(properties.color)
                            .opacity(properties.opacity)
                        Capsule()
                            .stroke(lineWidth: 5)
                            .foregroundColor(properties.color)
                    case .rectangle:
                        Rectangle()
                            .fill()
                            .foregroundColor(properties.color)
                            .opacity(properties.opacity)
                        Rectangle()
                            .stroke(lineWidth: 5)
                            .foregroundColor(properties.color)
                    }
                        

                }                }
            }
            .padding()
//            .foregroundColor(properties.color)
//            .opacity(properties.opacity)
        }
        .aspectRatio(2/3, contentMode: .fit)
        .padding()
    }
}

struct ClassicSetGameCardView_Previews: PreviewProvider {
    static var previews: some View {
        let props = ClassicSetGame.CardProperties(color: Color.red, shape: ClassicSetGame.Shape.rectangle, opacity: 1, count: 2)
        ClassicSetGameCardView(properties: props, height: 500)
    }
}
