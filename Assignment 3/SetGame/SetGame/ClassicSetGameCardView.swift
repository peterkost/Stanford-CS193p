//
//  ClassicSetGameCardView.swift
//  SetGame
//
//  Created by Peter Kostin on 2021-06-29.
//

import SwiftUI

struct ClassicSetGameCardView<Content: View>: View {
    let properties: ClassicSetGame.CardProperties
    let height: CGFloat
    let content: Content

    init(properties: ClassicSetGame.CardProperties, height: CGFloat, @ViewBuilder content: () -> Content) {
        self.properties = properties
        self.height = height
        self.content = content()
    }
    
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

                    content
                        .frame(height: height / 6)

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
        ClassicSetGameCardView(properties: props, height: 500) {
            Diamond()
                .fill()
                .foregroundColor(.red)
                .opacity(0.5)
            Diamond()
                .stroke(lineWidth: 5)
                .foregroundColor(.red)
        }
    }
}
