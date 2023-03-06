//
//  GameModelView.swift
//  GameHW2
//
//  Created by Julio leon on 3/3/23.
//

import SwiftUI

class GameModelView: ObservableObject {
    
//    var themes: Array<Theme>
//    var currentThemeIndex: Int
//
//    init () {
//        themes = [
//            Theme(name: "weather", color: "blue", numberOfPairs: 4, content: ["🌪", "❄️", "🌩", "🌧", "☀️", "🌦"].shuffled(), id: 0)
//        ]
//        currentThemeIndex = Int.random(in: 0..<themes.count)
//    }
    
//    static func createMemeoryGame() -> GameModel<String> {
////        let themes = [
////            Theme(name: "weather", color: "blue", numberOfPairs: 4, content: ["🌪", "❄️", "🌩", "🌧", "☀️", "🌦"].shuffled(), id: 0)
////        ]
////        let currentThemeIndex = Int.random(in: 0..<themes.count)
////
//        return GameModel<String>()
//    }
    
    @Published private var gameModel: GameModel<String> = GameModel<String>()
    
    var cards: Array<GameModel<String>.Card> {
        return gameModel.cards
    }
    
    func getThemeName () -> String {
        return gameModel.themes[gameModel.currentThemeIndex].name
    }
    
    func getThemeColor () -> String {
        return gameModel.themes[gameModel.currentThemeIndex].color
    }
    
    func getPoints () -> Int {
        return gameModel.points
    }
    
    func pickCard(pickedCard: GameModel<String>.Card) {
        return gameModel.pickCard(pickedCard: pickedCard)
    }
    
    func restartGame() {
        gameModel = GameModel<String>()
    }
}
