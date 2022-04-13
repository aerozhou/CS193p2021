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
    
    // 第二节课卡片尺寸和教程里不一样了。
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(emojis[0..<emojiCount], id:  \.self) { emoji in
                    CardView(content: emoji)
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
            Spacer()
            HStack {
                add
                Spacer()
                remove
            }
//            .font(.system(size: 60))
            .padding()
        }
    }
    
    var add: some View {
        Button(action: {
            if emojiCount < 12 {
                emojiCount += 1
            }
        }, label: {
            VStack {
                Image(systemName: "plus.circle")
                Text("Add")
            }
        })
        .foregroundColor(.black)
    }
    
    var remove: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }, label: {
            VStack {
                Image(systemName: "minus.circle")
                Text("Remove")
            }
        })
    }
            
}

struct CardView: View {
    
    @State var isFaceUp: Bool = true
    
    var content: String
    
    var body: some View {

        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            Text(content)
                .font(.largeTitle)
            
            if isFaceUp {
                shape
                    .strokeBorder(lineWidth: 10)
            } else {
                shape
                    .fill()
            }
        }
        .padding(.horizontal)
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct Content_preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
