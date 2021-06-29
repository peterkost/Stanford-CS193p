//
//  ClassicSetGameCardView.swift
//  SetGame
//
//  Created by Peter Kostin on 2021-06-29.
//

import SwiftUI

struct ClassicSetGameCardView<Content: View>: View {
    let properties: ClassicSetGame.CardProperties
    let content: Content

    init(properties: ClassicSetGame.CardProperties, @ViewBuilder content: () -> Content) {
        self.properties = properties
        self.content = content()
    }
    
    //  TODO: convert into viewbuilder to replace switch statement
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: 3)
            VStack {
                ForEach(0..<properties.count) { _ in
                    content
                }
                .padding()

            }
            .foregroundColor(properties.color)
            .opacity(properties.opacity)
        }
        .aspectRatio(2/3, contentMode: .fit)
        .padding()
    }
}

struct ClassicSetGameCardView_Previews: PreviewProvider {
    static var previews: some View {
        let props = ClassicSetGame.CardProperties(color: Color.red, shape: ClassicSetGame.Shape.rectangle, opacity: 1, count: 2)
        ClassicSetGameCardView(properties: props) {
            Rectangle()
        }
    }
}
