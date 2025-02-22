//
//  InfoView.swift
//  Nostrville2023
//
//  Created by Terry Yiu on 11/4/23.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let bitcoinPark = CLLocationCoordinate2D(latitude: InfoView.bitcoinParkLatitude, longitude: InfoView.bitcoinParkLongitude)
}

struct InfoView: View {
    private static let meetupUrl = "https://www.meetup.com/bitcoinpark/events/292518506/"
    private static let googleMapsUrl = "https://www.google.com/maps/search/?api=1&query=\(InfoView.bitcoinParkLatitude),\(InfoView.bitcoinParkLongitude)"
    private static let bitcoinParkAddress = "1912 21st Ave S, Nashville, TN 37212"
    private static let bitcoinParkName = "Bitcoin Park"
    static let bitcoinParkLatitude = 36.134666
    static let bitcoinParkLongitude = -86.80073
    private let bitcoinPark = MKMapItem(placemark: MKPlacemark(coordinate: .bitcoinPark) )

    init() {
        bitcoinPark.name = InfoView.bitcoinParkName
    }

    var body: some View {
        ScrollView {
            Image("nostrville")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 400, maxHeight: 400)
                .padding(.bottom, 10)

            if let url = URL(string: InfoView.meetupUrl) {
                Link("Meetup Event Page", destination: url)
                    .buttonStyle(.bordered)
            }

            Text(InfoView.bitcoinParkName)

            HStack {
                Button(
                    action: {
                        UIPasteboard.general.string = InfoView.bitcoinParkAddress
                    },
                    label: {
                        Label(InfoView.bitcoinParkAddress, systemImage: "doc.on.doc")
                    }
                )
                .buttonStyle(.bordered)
            }

            HStack {
                Text("Open in:")

                Button("Apple Maps") {
                    bitcoinPark.openInMaps()
                }
                .buttonStyle(.bordered)

                if let url = URL(string: InfoView.googleMapsUrl) {
                    Link("Google Maps", destination: url)
                        .buttonStyle(.bordered)
                }
            }
            .padding(.bottom, 10)

            Text(
"""
Join us for a special free two-day summit focused on the future of nostr, with an emphasis on the power of nostr + bitcoin. Nostr is a revolutionary new communication protocol that is censorship resistant and open. We will bring together builders, innovators, and developers from the world of nostr to explore the latest developments in this rapidly evolving space.

From exploring new use cases for nostr, to discussing the potential impact of zaps in the value for value world, this summit aims to be a thought-provoking and engaging event.

RSVP as space will be limited.
""")

            Divider()
                .frame(height: 4)
                .overlay(.purple)
                .padding(20)

            Text("This Nostrville 2023 unofficial app was built by Terry Yiu (tyiu) to reimagine conference apps in a Nostr world. This work is being used to inspire Confstr, a general-purpose Nostr conference app, powered by NIP-52 calendar events. If you have feedback, please find him at the event or message him. He can be found on the People > Speakers page of the app.")
        }
        .padding(20)
        .navigationTitle("Conference Info")
    }
}

#Preview {
    InfoView()
}
