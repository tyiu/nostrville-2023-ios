//
//  InfoView.swift
//  Nostrville2023
//
//  Created by Terry Yiu on 11/4/23.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let bitcoinPark = CLLocationCoordinate2D(latitude: 36.134666, longitude: -86.80073)
}

struct InfoView: View {
    private static let meetupUrl = URL(string: "https://www.meetup.com/bitcoinpark/events/292518506/")!

    private let bitcoinPark = MKMapItem(placemark: MKPlacemark(coordinate: .bitcoinPark) )

    init() {
        bitcoinPark.name = "Bitcoin Park"
    }

    var body: some View {
        ScrollView {
            Image("nostrville")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 10)

            Link("Meetup Event Page", destination: InfoView.meetupUrl)
                .buttonStyle(.bordered)

            HStack {
                Button("\(Image(systemName: "doc.on.doc")) 1912 21st Ave S, Nashville, TN 37212") {
                    UIPasteboard.general.string = "1912 21st Ave S, Nashville, TN 37212"
                }
                .buttonStyle(.bordered)
            }

            HStack {
                Text("Open in:")

                Button("Apple Maps") {
                    bitcoinPark.openInMaps()
                }
                .buttonStyle(.bordered)

                Link("Google Maps", destination: URL(string: "https://www.google.com/maps/search/?api=1&query=36.134666%2C%20-86.80073")!)
                    .buttonStyle(.bordered)
            }
            .padding(.bottom, 10)

            Text(
"""
Join us for a special free two-day summit focused on the future of nostr, with an emphasis on the power of nostr + bitcoin. Nostr is a revolutionary new communication protocol that is censorship resistant and open. We will bring together builders, innovators, and developers from the world of nostr to explore the latest developments in this rapidly evolving space.

From exploring new use cases for nostr, to discussing the potential impact of zaps in the value for value world, this summit aims to be a thought-provoking and engaging event.

RSVP as space will be limited.
""")
        }
        .padding(20)
    }
}

#Preview {
    InfoView()
}
