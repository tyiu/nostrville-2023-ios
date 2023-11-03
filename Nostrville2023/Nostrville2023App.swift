//
//  Nostrville2023App.swift
//  Nostrville2023
//
//  Created by Terry Yiu on 5/9/23.
//

import SwiftUI

@main
struct Nostrville2023App: App {
    private let appState = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView(appState: appState)
        }
    }
}
