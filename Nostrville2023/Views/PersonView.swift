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
                .contextMenu {
                    Button {
                        UIPasteboard.general.string = person.nostrPublicKey
                    } label: {
                        Text("Copy Nostr public key", comment: "Context menu option for copying a user's Nostr public key.")
                    }
                }
            Link("⚡️ Zap \(person.lightning)", destination: URL(string: "lightning:\(person.lightning)")!)
                .contextMenu {
                    Button {
                        UIPasteboard.general.string = person.lightning
                    } label: {
                        Text("Copy Lightning address", comment: "Context menu option for copying a user's Lightning address.")
                    }
                }
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
