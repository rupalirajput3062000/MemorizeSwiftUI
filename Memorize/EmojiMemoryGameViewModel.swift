//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Rupali Rajput on 06/03/23.
//

import Foundation

class EmojiMemoryGameViewModel: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["😂","😝","😁","😱","👉","🙌","🍻","🔥","🌈","☀","🎈","🌹","💄","🎀","⚽","🎾","🏁","😡","👿","🐻","🐶","🐬","🐟","🍀","👀","🚗","🍎","💝","💙","👌","❤","😍","😉","😓","😳","💪","💩","🍸","🔑","💖","🌟","🎉","🌺","🎶","👠","🏈","⚾","🏆","👽","💀","🐵","🐮","🐩","🐎","💣","👃","👂","🍓","💘","💜","👊","💋","😘","😜","😵","🙏","👋","🚽","💃","💎","🚀","🌙","🎁","⛄","🌊","⛵","🏀","🎱","💰","👶","👸","🐰","🐷","🐍","🐫","🔫","👄","🚲","🍉","💛","💚"]
    
    @Published private var model = MemoryGame(numberOfPairOfCards: 3) { indx in emojis[indx] }
    
    var cards: [Card] {
        return model.cards
    }
    
    
    //    MARK: User Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
}
