//
//  PersonView.swift
//  Nostrville2023
//
//  Created by Terry Yiu on 5/10/23.
//

import SwiftUI

struct PersonView: View {
    @State var satsString: String = "1000"
    @State var comment: String = "Thanks for providing value at Nostrville!"
    @State var showTipSheet: Bool = false

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

            if let nostrUrl = URL(string: "nostr:\(person.nostrPublicKey)") {
                Link("Nostr Profile", destination: nostrUrl)
                    .buttonStyle(.bordered)
                    .contextMenu {
                        Button {
                            UIPasteboard.general.string = person.nostrPublicKey
                        } label: {
                            Text("Copy Nostr public key", comment: "Context menu option for copying a user's Nostr public key.")
                        }
                    }
            }

            if let lightningIdentifier = person.lightningIdentifier, person.lnUrl != nil {
                Button("⚡️ Tip with Lightning") {
                    showTipSheet = true
                }
                .buttonStyle(.bordered)
                .contextMenu {
                    Button {
                        UIPasteboard.general.string = person.lightningIdentifier
                    } label: {
                        Label(lightningIdentifier, systemImage: "doc.on.doc")
                    }
                }
            }

            Image(person.picture)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 200, maxHeight: 200)
        }
        .padding(10)
        .sheet(isPresented: $showTipSheet, onDismiss: { showTipSheet = false }, content: {
            TipView(person: person, showTipSheet: $showTipSheet)
        })
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(person: ConferenceView_Previews.tyiu)
    }
}
