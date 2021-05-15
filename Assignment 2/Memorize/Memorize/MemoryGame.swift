//
//  MemoryGame.swift
//  Memorize
//
//  Created by Peter Kostin on 2021-05-08.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: [Card]
    var score: Int = 0
    var lastCardPickTime = DispatchTime.now()
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp}.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        if  let chosenIndex  = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                // Cacluate score multiplier based on time
                let currentTime = DispatchTime.now()
                let nanoSecondsSinceLastCardPick = currentTime.uptimeNanoseconds - lastCardPickTime.uptimeNanoseconds
                let secondsSinceLastCardPick = Int(ceil(Double(nanoSecondsSinceLastCardPick/1000000000)))
                
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += max(10 - secondsSinceLastCardPick, 1) * 2
                } else {
                    if cards[chosenIndex].seen { score -= max(10 - secondsSinceLastCardPick, 1) * 1}
                    if cards[potentialMatchIndex].seen { score -= max(10 - secondsSinceLastCardPick, 1) * 1}
                }
                cards[chosenIndex].isFaceUp = true
                cards[chosenIndex].seen = true
                cards[potentialMatchIndex].seen = true
                lastCardPickTime = DispatchTime.now()
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var seen: Bool = false
        var content: CardContent
        var id: Int
    }
}
