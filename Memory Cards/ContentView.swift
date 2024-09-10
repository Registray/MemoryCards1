        //
        //  ContentView.swift
        //  Memory Cards
        //
        //  Created by Oleh Pauk on 07.09.2024.
        //
        import SwiftUI
        
        
        struct ContentView: View {
            
//            static var themes: Array<Theme> = [
//                Theme(name: "Cars", emojis: ["🚁","🚀","✈️","🛳","🚗","⛴","🚜","🚂","🚕","🚛","🚒","🛵","🏍","🛻","🚐"], numberOfPairsCards: 5,
//                      color: "red"),
//                Theme(name: "Balls", emojis: ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉"],
//                      numberOfPairsCards: 4,
//                      color: "green"),
//                Theme(name: "heart", emojis: ["❤️","💙","💜","🖤","🤎","🤍","💛","💚"], numberOfPairsCards: 4, color: "blue")
//            ] IT IS MADE FOR FUTURE!!
            
            @State var cardCount: Int = 10
            
            @State var emojis = ["🚁","🚀","✈️","🛳","🚗","⛴","🚜","🚂","🚕","🚛","🚒","🛵","🏍","🛻","🚐"]
            @State var carTheme = ["🚁","🚀","✈️","🛳","🚗","⛴","🚜","🚂","🚕","🚛","🚒","🛵","🏍","🛻","🚐"]
            @State var ballsTheme = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉"]
            @State var heartTheme = ["❤️","💙","💜","🖤","🤎","🤍","💛","💚"]
            
            var body: some View {
                VStack{
                    Text("MEMORIZE!").font(.largeTitle)
                    ScrollView{
                        cards
                    }
                    Spacer()
                    cardCountAdjusters
                }
                .padding()
            }
            var cards: some View {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(0..<cardCount, id: \.self) { index in
                        CardView(content: emojis[index])
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.orange)
            }
            var cardCountAdjusters: some View {
                HStack {
                    Spacer()
                    themeChooser
                }
                .imageScale(.large)
                .font(.largeTitle)
            }
            
            var themeChooser: some View {
                HStack {
                    Button(action: {
                        cardCount = carTheme.count
                        emojis = carTheme.shuffled()
                    }, label: {
                        VStack {
                        Image(systemName: "car")
                            Text("Vehicles")
                        }
                    })
                    Spacer()
                    Button(action: {
                        cardCount = ballsTheme.count
                        emojis = ballsTheme.shuffled()
                    }, label: {
                        VStack {
                        Image(systemName: "circle")
                            Text("Balls")
                        }
                    })
                    Spacer()
                    Button(action: {
                        cardCount = heartTheme.count
                        emojis = heartTheme.shuffled()
                    }, label: {
                        VStack {
                        Image(systemName: "heart")
                            Text("Heart")
                        }
                    })
                }
                .font(.largeTitle)
                .imageScale(.large)
            }
        }
        
        struct CardView: View {
            let content: String
            @State var isFaceUp = false
            var body: some View {
                ZStack {
                    let base = RoundedRectangle(cornerRadius: 12)
                    Group {
                        base.foregroundColor(.white)
                        base.strokeBorder(lineWidth: 2)
                        Text(content).font(.largeTitle)
                    }
                    .opacity(isFaceUp ? 1:0)
                    base.fill().opacity(isFaceUp ? 0 : 1)
                }.onTapGesture {
                    isFaceUp.toggle()
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
        
