// This is a ViewModel, which is part of the UI.
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 周宇航 on 2022/4/16.
//

import SwiftUI

class EmojiMemoryGame {
    // static的用法
   static let emojis: Array<String> = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐽", "🐸", "🐵", "🐔", "🦉", "🦇", "🐺", "🦄", "🦋", "🦀"]
    
   static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return  model.cards
    }
}
