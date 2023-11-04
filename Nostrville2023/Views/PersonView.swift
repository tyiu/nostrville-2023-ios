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
        ScrollView {
            Text(person.name)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
            Text(person.description)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
            Link("Nostr Profile", destination: URL(string: "nostr:\(person.nostrPublicKey)")!)
                .buttonStyle(.bordered)
                .contextMenu {
                    Button {
                        UIPasteboard.general.string = person.nostrPublicKey
                    } label: {
                        Text("Copy Nostr public key", comment: "Context menu option for copying a user's Nostr public key.")
                    }
                }
            Link("⚡️ Zap \(person.lightning)", destination: URL(string: "lightning:\(person.lightning)")!)
                .buttonStyle(.bordered)
                .contextMenu {
                    Button {
                        UIPasteboard.general.string = person.lightning
                    } label: {
                        Text("Copy Lightning address", comment: "Context menu option for copying a user's Lightning address.")
                    }
                }
            Image(person.picture)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 200, maxHeight: 200)
        }
        .padding(10)
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(person: ConferenceView_Previews.tyiu)
    }
}
