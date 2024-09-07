//
//  ContentView.swift
//  Memory Cards
//
//  Created by Oleh Pauk on 07.09.2024.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        HStack{
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var body: some View {
        HStack{
        ZStack(content: {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(lineWidth: 2)
            Text("🚁").font(.largeTitle)
        })
}
    }



















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
            ContentView()
        }
    }
}
}
