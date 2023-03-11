//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Rupali Rajput on 06/03/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var game = EmojiMemoryGameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
