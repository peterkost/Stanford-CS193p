//
//  ClassicSetGameCardView.swift
//  SetGame
//
//  Created by Peter Kostin on 2021-06-29.
//

import SwiftUI

struct ClassicSetGameCardView: View {
    let properties: ClassicSetGame.CardProperties
    
    //  TODO: convert into viewbuilder to replace switch statement
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: 3)
            VStack {
                ForEach(0..<properties.count) { _ in
                    switch properties.shape {
                    case .diamond:
                        Circle()
                    case .oval:
                        Capsule()
                    case .rectangle:
                        Rectangle()
                    }
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
        ClassicSetGameCardView(properties: props)
    }
}
