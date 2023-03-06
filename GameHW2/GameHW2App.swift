//
//  GameHW2App.swift
//  GameHW2
//
//  Created by Julio leon on 3/3/23.
//

import SwiftUI

@main
struct GameHW2App: App {
    var game = GameModelView()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
