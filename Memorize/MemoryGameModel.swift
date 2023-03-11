//
//  MemoryGameModel.swift
//  Memorize
//
//  Created by Rupali Rajput on 06/03/23.
//

import Foundation

struct MemoryGame<CardContent: Equatable > {
    
    private(set) var cards: [Card]
    private var cardsOnlyFaceUp: Int? {
        get { cards.indices.filter { idx in cards[idx].isFaceUp }.oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    
    init(numberOfPairOfCards: Int, getTheCardContent: (Int) -> CardContent) {
        cards = []
        for pairIndx in 0..<numberOfPairOfCards {
            let cardContent = getTheCardContent(pairIndx)
            cards.append(Card(cardContent: cardContent, id: 2*pairIndx))
            cards.append(Card(cardContent: cardContent, id: 2*pairIndx + 1))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let idx = cards.firstIndex(where: { $0.id == card.id }), !cards[idx].isMatched, !cards[idx].isFaceUp {
            
            if let cardsOnlyFaceUpIndx = cardsOnlyFaceUp {
                if matchTheContent(cardsOnlyFaceUpIndx, idx) {
                    cards[cardsOnlyFaceUpIndx].isMatched = true
                    cards[idx].isMatched = true
                }
                cards[idx].isFaceUp = true
            } else {
                cardsOnlyFaceUp = idx
            }
        }
    }
    
    private func matchTheContent(_ faceUpCardIndx: Int, _ selectedCardIndx: Int) -> Bool {
        if cards[faceUpCardIndx].cardContent == cards[selectedCardIndx].cardContent {
            return true
        }
        return false
    }

    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let cardContent: CardContent
        let id: Int
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
