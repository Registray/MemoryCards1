        //
        //  ContentView.swift
        //  Memory Cards
        //
        //  Created by Oleh Pauk on 07.09.2024.
        //
        
        import SwiftUI
        
        
        struct ContentView: View {
            let emojis = ["🚁","🚀","✈️","🛳","🚗","⛴","🚜","🚂","🚕","🚛","🚒","🛵","🏍","🛻","🚐"]
            
            @State var cardCount: Int = 4
            
            var body: some View {
                VStack{
                    ScrollView{
                        cards
                    }
                    Spacer()
                    cardCountAdjusters
                }
                .padding()
            }
            var cards: some View {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120)) ,GridItem()]) {
                    ForEach(0..<cardCount, id: \.self) { index in
                        CardView(content: emojis[index])
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.orange)
            }
            var cardCountAdjusters: some View {
                HStack {
                    cardAdder
                    Spacer()
                    cardRemover
                }
                .imageScale(.large)
                .font(.largeTitle)
            }
            
            func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
                Button(action: {
                    cardCount += offset
                }, label: {
                    Image(systemName: symbol)
                })
                .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
            }
            
            var cardRemover: some View {
                return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
            }
            var cardAdder: some View {
                return cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
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
        
