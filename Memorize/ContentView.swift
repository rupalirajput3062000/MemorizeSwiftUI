//
//  ContentView.swift
//  Memorize
//
//  Created by Rupali Rajput on 06/03/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding()
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 25)
        ZStack {
            if card.isFaceUp {
                shape.foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                    .foregroundColor(.red)
                Text(card.cardContent).font(.largeTitle)
            } else if card.isMatched {
                shape.fill(.red).opacity(0)
            } else {
                shape.fill(.red)
            }
        }
    }
}





























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGameViewModel())
        ContentView(viewModel: EmojiMemoryGameViewModel())
            .preferredColorScheme(.dark)
    }
}
