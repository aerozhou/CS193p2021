//
//  ContentView.swift
//  Memorize
//
//  Created by 周宇航 on 2022/4/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
            Text("Hello, world!")
        }
        .foregroundColor(.orange)
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
