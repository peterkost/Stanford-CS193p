//
//  SetGame.swift
//  SetGame
//
//  Created by Peter Kostin on 2021-06-29.
//

import Foundation

struct SetGame {
    private(set) var cards = [Card]()
    private var chosenCardsIndices: [Int] {
        var res = [Int]()
        
        for i in cards.indices where cards[i].isSelected {
            res.append(i)
        }
        return res
    }
    
    private(set) var deckEmpty = false
    var validSetSelected: Bool? {
        if chosenCardsIndices.count == 3 {
            return validSet()
        }
        return nil
    }
    
    init(createCards: () -> [Card]) {
        cards = createCards()
        
        cards.shuffle()
        
        for n in 0..<12 {
            cards[n].location = .onBoard
        }
    }
    
    mutating func choose(_ card: Card) {
        if let i = cards.firstIndex(where: { $0.id == card.id}) {
//            print(ClassicSetGame().cardPropertiesDecoder(cards[i].properties))
            if chosenCardsIndices.count == 3 {
                if validSet() {
                    for i in chosenCardsIndices {
                        cards[i].isSelected = false
                        cards[i].location = .discarded
                    }
                    dealCards()
                } else {
                    for i in chosenCardsIndices {
                        cards[i].isSelected = false
                    }
                    cards[i].isSelected.toggle()
                }
 
            } else {
                cards[i].isSelected.toggle()
            }
        }
    }
    
    mutating func dealCards() {
        if validSetSelected == true {
            for i in chosenCardsIndices {
                cards[i].isSelected = false
                cards[i].location = .discarded
            }
        }
        var dealt = 0
        for i in cards.indices where cards[i].location == .inDeck {
            cards[i].location = .onBoard
            dealt += 1
            if dealt == 3 {
                return
            }
        }
        deckEmpty = true
    }
    
    func validSet() -> Bool {
        var res = true
        
        for propertyIndex in 0..<cards[0].properties.count {
            var curProperty = Set<Int>()
            for cardIndex in chosenCardsIndices {
                curProperty.insert(cards[cardIndex].properties[propertyIndex].hashValue)
            }
            res = res && (curProperty.count == 1 || curProperty.count == 3)
            if !res {
                return false
            }
        }
        return true
    }
    
    struct Card: Identifiable {
        let id = UUID()
        var location = Location.inDeck
        var isSelected = false
        let properties: [Property]
    }
    
    enum Location {
        case inDeck, onBoard, discarded
    }
    
    enum Property: CaseIterable {
        case a, b, c
    }
}
