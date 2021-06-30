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
        
        for i in 0..<cards.count where cards[i].isSelected {
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
    
    mutating func choose(_ card: Card) {
        if let i = cards.firstIndex(where: { $0.id == card.id}) {
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
        print(chosenCardsIndices)
    }
    
    mutating func dealCards() {
        if validSetSelected == true {
            for i in chosenCardsIndices {
                cards[i].isSelected = false
                cards[i].location = .discarded
            }
        }
        var dealt = 0
        for i in 0..<cards.count where cards[i].location == .inDeck {
            cards[i].location = .onBoard
            dealt += 1
            if dealt == 3 {
                return
            }
        }
        deckEmpty = true
    }
    
    func validSet() -> Bool {
        var property1Values = [Int]()
        var property2Values = [Int]()
        var property3Values = [Int]()
        var property4Values = [Int]()
        
        for i in chosenCardsIndices {
            let card = cards[i]
            print(card)
            property1Values.append(card.property1.hashValue)
            property2Values.append(card.property2.hashValue)
            property3Values.append(card.property3.hashValue)
            property4Values.append(card.property4.hashValue)
        }
        
        // either the values were all the same or all different
        let property1IsValid = Set(property1Values).count == 1 || Set(property1Values).count == 3
        let property2IsValid = Set(property2Values).count == 1 || Set(property2Values).count == 3
        let property3IsValid = Set(property3Values).count == 1 || Set(property3Values).count == 3
        let property4IsValid = Set(property4Values).count == 1 || Set(property4Values).count == 3
        
        return property1IsValid && property2IsValid && property3IsValid && property4IsValid
    }
    
    struct Card: Identifiable {
        let id = UUID()
        var location =  Location.inDeck
        var isSelected = false
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
