//
//  SetGame.swift
//  SetGame
//
//  Created by Peter Kostin on 2021-06-29.
//

import Foundation

struct SetGame {
    private(set) var cards = [Card]()
    
    init() {
        for i in Property.allCases {
            for j in Property.allCases {
                for k in Property.allCases {
                    for l in Property.allCases {
                        cards.append(Card(property1: i, property2: j, property3: k, property4: l))
                    }
                }
            }
        }
        
        cards.shuffle()
        
        for n in 0..<12 {
            cards[n].location = .onBoard
        }
    }
    
    struct Card: Identifiable {
        let id = UUID()
        var location =  Location.inDeck
        let property1: Property
        let property2: Property
        let property3: Property
        let property4: Property
    }
    
    enum Location {
        case inDeck, onBoard, discarded
    }
    
    enum Property: CaseIterable {
        case a, b, c
    }
}
