//
//  MemoryGame.swift
//  Memorize
//
//  Created by Henrique Matheus Alves Pereira on 27/12/20.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2, pair: numberOfPairsOfCards))
            cards.append(Card(content: content, id: pairIndex*2+1, pair: numberOfPairsOfCards))
        }
        cards.shuffle() //HMAP
    }

    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
        var pair: Int //HMAP
    }
}
