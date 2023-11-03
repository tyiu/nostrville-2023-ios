//
//  Nostrville2023App.swift
//  Nostrville2023
//
//  Created by Terry Yiu on 5/9/23.
//

import SwiftUI

@main
struct Nostrville2023App: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                VStack {
                    ConferenceView(conference: ConferenceView_Previews.nostrville2023)
                }
                .navigationTitle("Nostrville 2023")
            }
        }
    }
}
