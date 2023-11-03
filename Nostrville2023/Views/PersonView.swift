//
//  PersonView.swift
//  Nostrville2023
//
//  Created by Terry Yiu on 5/10/23.
//

import SwiftUI

struct PersonView: View {
    let person: Person

    var body: some View {
        VStack(alignment: .center) {
            Text(person.name)
                .font(.headline)
            Text(person.description)
                .font(.subheadline)
            Link("Nostr Profile", destination: URL(string: "nostr:\(person.nostrPublicKey)")!)
            Link("⚡️ Zap", destination: URL(string: person.lightning)!)
            Image(person.picture)
                .resizable()
                .frame(maxWidth: 200, maxHeight: 200)

        }
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(person: ConferenceView_Previews.tyiu)
    }
}
