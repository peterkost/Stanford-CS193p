//
//  SetGameApp.swift
//  SetGame
//
//  Created by Peter Kostin on 2021-06-29.
//

import SwiftUI

@main
struct SetGameApp: App {
    var body: some Scene {
        WindowGroup {
            ClassicSetGameView(game: ClassicSetGame())
        }
    }
}
