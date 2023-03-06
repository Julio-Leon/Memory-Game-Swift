//
//  GameModel.swift
//  GameHW2
//
//  Created by Julio leon on 3/3/23.
//

import Foundation

struct GameModel<CardContent> where CardContent: Equatable {
    
    var points: Int!
    
    var cards = Array<Card>()
    
    var indexFaceUp: Int?
    
    var themes = [
        Theme(name: "Weather", color: "blue", numberOfPairs: 4, content: ["🌪", "❄️", "🌩", "🌧", "☀️", "🌦"].shuffled(), id: 0),
        Theme(name: "Animals", color: "red", numberOfPairs: 5, content: ["🐶", "🐱", "🐭", "🐹", "🐰"].shuffled(), id: 1),
        Theme(name: "Plants", color: "green", numberOfPairs: 7, content: ["🪴", "🍀", "🌿", "🌴", "🌳", "🎄", "🌵"].shuffled(), id: 2),
        Theme(name: "Food", color: "orange", numberOfPairs: 6, content: ["🍏", "🍎", "🍊", "🍌", "🍉", "🍇"].shuffled(), id: 3),
        Theme(name: "Sports", color: "yellow", numberOfPairs: 5, content: ["⚽️", "🏈", "🏀", "🥎", "🎱"].shuffled(), id: 4),
        Theme(name: "Flags", color: "purple", numberOfPairs: 6, content: ["🇧🇭", "🇧🇾", "🇰🇾", "🇧🇼", "🇨🇳", "🇦🇶"].shuffled(), id: 5)
    ]
    
    let currentThemeIndex: Int
    
    init() {
        points = 0
        currentThemeIndex = Int.random(in: 0..<themes.count)

        let pairs =
            themes[currentThemeIndex].numberOfPairs > themes[currentThemeIndex].content.count ?
            themes[currentThemeIndex].content.count :
            themes[currentThemeIndex].numberOfPairs

        for index in 0..<pairs {
            let myContent = themes[currentThemeIndex].content[index]
            cards.append(Card(id: index*2, content: myContent))
            cards.append(Card(id: index*2+1, content: myContent))
        }
        cards.shuffle()
    }

    mutating func pickCard (pickedCard: Card) {
        if let index = cards.firstIndex(where: {$0.id == pickedCard.id}),
           !cards[index].isFaceUp,
           !cards[index].isMatched {
            if let maybeMatch = indexFaceUp {
                if cards[index].content == cards[maybeMatch].content {
                    cards[index].isMatched = true
                    cards[maybeMatch].isFaceUp = true
                    cards[maybeMatch].isMatched = true
                    points += 2
                }
                indexFaceUp = nil
            } else {
                for i in cards.indices {
                    cards[i].isFaceUp = false
                }
                indexFaceUp = index
                if cards[index].wasFaceUp {
                    points -= 1
                } else {
                    cards[index].wasFaceUp = true
                }
            }
            cards[index].isFaceUp = true
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var content: String
        var isFaceUp = false
        var isMatched = false
        var wasFaceUp = false
    }
}

struct Theme: Identifiable {
    var name: String
    var color: String
    var numberOfPairs: Int
    var content: Array<String>
    var id: Int
}

