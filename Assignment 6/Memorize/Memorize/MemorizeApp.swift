//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Peter Kostin on 2021-06-25.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var themeStore = ThemeStore()
    @StateObject var viewModel = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel, themeStore: themeStore)
        }
    }
}
