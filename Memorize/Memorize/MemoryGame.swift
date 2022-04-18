//
//  MemoryGame.swift
//  Memorize
//
//  Created by 周宇航 on 2022/4/16.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    //
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            //
            let content = createCardContent(pairIndex)
            //
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    
    struct Card {
        // 初始值都为false
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        // CardContent是什么类型，we don't care
        var content: CardContent
    }
}
