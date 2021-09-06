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
    
    var body: some Scene {
        WindowGroup {
            ThemeSelectView(themeStore: themeStore)
        }
    }
}
