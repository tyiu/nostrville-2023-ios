//
//  PeopleView.swift
//  Nostrville2023
//
//  Created by Terry Yiu on 5/10/23.
//

import SwiftUI

struct PeopleView: View {
    let speakers: [Person]
    let organizers: [Person]

    @State var selectedGroupIndex: Int = 0

    var body: some View {
        VStack {
            Picker(selection: $selectedGroupIndex, label: Text("Group")) {
                Text(
                    "Speakers",
                    comment: "Picker option to show list of conference speakers."
                ).tag(0)
                Text(
                    "Organizers",
                    comment: "Picker option to show list of conference organizers."
                ).tag(1)
            }
            .pickerStyle(.segmented)
            List {
                if selectedGroupIndex == 0 {
                    ForEach(speakers.sorted { $0.name.lowercased() < $1.name.lowercased() }, id: \.self) { speaker in
                        HStack {
                            Image(speaker.picture)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 100, maxHeight: 100)
                            NavigationLink(destination: PersonView(person: speaker)) {
                                Text(speaker.name)
                            }.navigationTitle("People")
                        }
                    }
                } else {
                    ForEach(organizers.sorted { $0.name.lowercased() < $1.name.lowercased() }, id: \.self) { speaker in
                        HStack {
                            Image(speaker.picture)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 100, maxHeight: 100)
                            NavigationLink(destination: PersonView(person: speaker)) {
                                Text(speaker.name)
                            }.navigationTitle("People")
                        }
                    }
                }
            }
        }
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView(
            speakers: ConferenceView_Previews.nostrville2023.sessions.flatMap { $0.speakers },
            organizers: ConferenceView_Previews.organizers
        )
    }
}
