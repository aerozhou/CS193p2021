//
//  ContentView.swift
//  Memorize
//
//  Created by 周宇航 on 2022/4/9.
//

import SwiftUI

struct ContentView: View {
    
    // 本练习数组里的元素得一致，不然会出问题。
    var emojis: Array<String> = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐽", "🐸", "🐵", "🐔", "🦉", "🦇", "🐺", "🦄", "🦋", "🦀"]
    
    @State var emojiCount = 20
    

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id:  \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 8)
                Text(content).font(.largeTitle)
            } else {
                shape
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct Content_preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
