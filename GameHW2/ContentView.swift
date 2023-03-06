//
//  ContentView.swift
//  GameHW2
//
//  Created by Julio leon on 3/3/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: GameModelView
    
    
    
    var body: some View {
        
        let themeColor = Color(viewModel.getThemeColor())
        
        VStack {
            Text(viewModel.getThemeName()).font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.pickCard(pickedCard: card)
                            }
                    }
                }
            }
            .foregroundColor(themeColor)
            .padding(.horizontal)
            HStack {
                Text("Points: ")
                Text(String(viewModel.getPoints()))
            }
            Button(action: viewModel.restartGame, label: {
                Text("New Game")
            })
        }
    }
}

struct CardView: View {
    
    let card: GameModel<String>.Card
    
    init(_ card: GameModel<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack(alignment: .center) {
                let shape = RoundedRectangle(cornerRadius: 25.0)
            
                if card.isFaceUp {
                    shape
                        .fill()
                        .foregroundColor(.white)
                    
                    shape
                        .strokeBorder(lineWidth: 3.0)
                    
                    Text(card.content)
                        .font(.largeTitle)
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameModelView()
        ContentView(viewModel: game)
    }
}
