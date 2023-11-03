//
//  ConferenceView.swift
//  Nostrville2023
//
//  Created by Terry Yiu on 5/10/23.
//

import SwiftUI

struct ConferenceView: View {
    private let conference: Conference
    private let dateFormatter = DateFormatter()
    private var calendar = Calendar.current

    @State var selectedDayIndex: Int = 0

    init(conference: Conference) {
        self.conference = conference

        calendar.timeZone = conference.timeZone

        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.timeZone = conference.timeZone
    }

    var body: some View {
        TabView {
            ScheduleView(conference: conference)
                .tabItem {
                    Label("Schedule", systemImage: "calendar")
                }

            PeopleView(
                speakers: Array(Set(conference.sessions.flatMap { $0.speakers })),
                organizers: conference.organizers
            )
            .tabItem {
                Label("People", systemImage: "person")
            }
        }
        .navigationTitle(conference.name)
    }
}

struct ConferenceView_Previews: PreviewProvider {

    static let isoDateFormatter = ISO8601DateFormatter()

    static let nostrville2023 = Conference(
        name: "Nostrville 2023",
        startDate: isoDateFormatter.date(from: "2023-11-09T09:00:00-06:00")!,
        endDate: isoDateFormatter.date(from: "2023-11-10T14:00:00-06:00")!,
        location: "Nashville, Tennessee",
        timeZone: TimeZone(identifier: "America/Tell_City") ?? TimeZone.current,
        sessions: sessions,
        organizers: organizers
    )

    static let odell = Person(
        nostrPublicKey: "npub1qny3tkh0acurzla8x3zy4nhrjz5zd8l9sy9jys09umwng00manysew95gx",
        name: "ODELL",
        description: "freedom tech is hope 🫡",
        picture: "odell",
        lightning: "odell@vlt.ge"
    )

    static let miljan = Person(
        nostrPublicKey: "npub16c0nh3dnadzqpm76uctf5hqhe2lny344zsmpm6feee9p5rdxaa9q586nvr",
        name: "miljan",
        description: "CEO of Primal. Building apps and services for Nostr.",
        picture: "miljan",
        lightning: "miljan@primal.net"
    )

    static let tyiu = Person(
        nostrPublicKey: "npub1yaul8k059377u9lsu67de7y637w4jtgeuwcmh5n7788l6xnlnrgs3tvjmf",
        name: "Terry Yiu",
        description: "Founder @ Nostrville2023\nContributor @ Damus\nEngineer @ Cash App",
        picture: "tyiu",
        lightning: "tyiu@tyiu.xyz"
    )

    static let tony = Person(
        nostrPublicKey: "npub1t0nyg64g5vwprva52wlcmt7fkdr07v5dr7s35raq9g0xgc0k4xcsedjgqv",
        name: "Tony",
        description: "Building Mutiny Wallet",
        picture: "tony",
        lightning: "TonyGiorgio@stacker.news"
    )

    static let rod = Person(
        nostrPublicKey: "npub1atn7mlwt08erz4ap47gef92xfey65a4z9ed9vec53u5kc9v94pusl6h4x3",
        name: "Rod",
        description: "Nostrville 2023 🧡",
        picture: "rod",
        lightning: "bitkite@getalby.com"
    )

    static let rockstar = Person(
        nostrPublicKey: "npub1j8y6tcdfw3q3f3h794s6un0gyc5742s0k5h5s2yqj0r70cpklqeqjavrvg",
        name: "Uncle Rockstar",
        description: "#Bitcoin Uncle. Core contributor @BtcPayServer. Philosopher, Cypherpunk, Unifier. Short Twitter (and other BS), Long Nostr!",
        picture: "rockstar",
        lightning: "rockstar@snort.social"
    )

    static let mads = Person(
        nostrPublicKey: "npub1rpes5hhk6mxun5ddt5kecxfm8y3xdr0h5jwal32mc6mxafr48hxsaj2et2",
        name: "mads",
        description: "Running bitcoin & ⚡️",
        picture: "mads",
        lightning: "mads@getalby.com"
    )

    static let jb55 = Person(
        nostrPublicKey: "npub1xtscya34g58tk0z605fvr788k263gsu6cy9x0mhnm87echrgufzsevkk5s",
        name: "William Casarin",
        description: "I made damus, npubs and zaps. banned by apple & the ccp. my notes are not for sale.",
        picture: "jb55",
        lightning: "jb55@jb55.com"
    )

    static let yegor = Person(
        nostrPublicKey: "npub1z4m7gkva6yxgvdyclc7zp0vz4ta0s2d9jh8g83w03tp5vdf3kzdsxana6p",
        name: "yegorpetrov",
        description: "#Bitcoin 🧡 #nostr  💜",
        picture: "yegor",
        lightning: "yegorpetrov@getalby.com"
    )

    static let sersleepy = Person(
        nostrPublicKey: "npub1jk9h2jsa8hjmtm9qlcca942473gnyhuynz5rmgve0dlu6hpeazxqc3lqz7",
        name: "Ser Sleepy",
        description: "A frog of many trades 🐸",
        picture: "sersleepy",
        lightning: "sersleepy@getalby.com"
    )

    static let derekross = Person(
        nostrPublicKey: "npub18ams6ewn5aj2n3wt2qawzglx9mr4nzksxhvrdc4gzrecw7n5tvjqctp424",
        name: "Derek Ross",
        description: "Bitcoiner. Drinker of delicious beer. Cast iron skillet lover. Systems Administrator. Building NostrPlebs.com and NostrNests.com",
        picture: "derekross",
        lightning: "derekross@getalby.com"
    )

    static let island = Person(
        nostrPublicKey: "npub1jzuma368395gu523y4vk4d34p0lxgctk436hggn4qcuj93075qgqtn3vm0",
        name: "island",
        description: "₿ |⚡️| @Bitcoin Park | #nostrica | #nodestrich | #bitcoin2023 | #btcprague | #BH2023 | #TABconf | #nostrasia | primal.net/island",
        picture: "island",
        lightning: "island@walletofsatoshi.com"
    )

    static let avi = Person(
        nostrPublicKey: "npub1hqaz3dlyuhfqhktqchawke39l92jj9nt30dsgh2zvd9z7dv3j3gqpkt56s",
        name: "Avi Burra",
        description: "Bitcoin Surrealist",
        picture: "avi",
        lightning: "weirdparsnip79@walletofsatoshi.com"
    )

    static let doc = Person(
        nostrPublicKey: "npub1xy54p83r6wnpyhs52xjeztd7qyyeu9ghymz8v66yu8kt3jzx75rqhf3urc",
        name: "doc",
        description:
"""
        "@NostReport | Physician | Bitcoiner | #plebchain  | #docchain

        Think about it, do it.
""",
        picture: "doc",
        lightning: "0x72078c6c7c3e4026@ln.tips"
    )

    static let tatum = Person(
        nostrPublicKey: "npub1hte85nxymfyez0nlmmxf287nh9cujfuetxhk9vptwcdqg0pn8pxqxasw3d",
        name: "TatumTurnUp",
        description:
"""
Host of Between Two ASICs

Bought pizza, wine, and S9s using Bitcoin on Nostr

I like talking about Bitcoin Mining

Nostr class of Dec ‘22
""",
        picture: "tatum",
        lightning: "tatumturnup@walletofsatoshi.com"
    )

    static let roya = Person(
        nostrPublicKey: "npub1csamkk8zu67zl9z4wkp90a462v53q775aqn5q6xzjdkxnkvcpd7srtz4x9",
        name: "roya",
        description: "",
        picture: "roya",
        lightning: "roya@getalby.com"
    )

    static let vanessa = Person(
        nostrPublicKey: "npub1h50pnxqw9jg7dhr906fvy4mze2yzawf895jhnc3p7qmljdugm6gsrurqev",
        name: "Vanessa",
        description: "Marketer, mom, living at @damus headquarters",
        picture: "vanessa",
        lightning: "vanessagray31@getalby.com"
    )

    static let susie = Person(
        nostrPublicKey: "npub1jt0x3vsnqtazzda3ewa8ykdch2t8k566qhrd9vyy0k0ntleu744q8h6q3n",
        name: "Susiebdds",
        description: "The artist formerly known as Beefybush79@walletofsatoshi.com",
        picture: "susie",
        lightning: "beefybush69@walletofsatoshi.com"
    )

    static let preston = Person(
        nostrPublicKey: "npub1s5yq6wadwrxde4lhfs56gn64hwzuhnfa6r9mj476r5s4hkunzgzqrs6q7z",
        name: "preston",
        description: "Bitcoin & books. My bitcoin can remain in cold storage far longer than the market can remain irrational. @PrestonPysh on Twitter.",
        picture: "preston",
        lightning: "prestonpysh@getalby.com"
    )

    static let corndalorian = Person(
        nostrPublicKey: "npub1lrnvvs6z78s9yjqxxr38uyqkmn34lsaxznnqgd877j4z2qej3j5s09qnw5",
        name: "corndalorian",
        description: "bitcoin. memes. music. nostr report. 💜",
        picture: "corndalorian",
        lightning: "corn@walletofsatoshi.com"
    )

    static let quietWarrior = Person(
        nostrPublicKey: "npub1tvqc82mv8cezhax5r34n4muc2c4pgjz8kaye2smj032nngg52clq0rkrq4",
        name: "QW",
        description:
"""
        Co-Host Plebchain Radio
        #Plebchain #Zapathon
""",
        picture: "quietwarrior",
        lightning: "QW@WalletOfSatoshi.com"
    )

    static let sessionWelcomeAndGoals = Session(
        id: "welcome-and-goals",
        name: "Welcome and Goals",
        speakers: [
            rod,
            rockstar,
            mads
        ],
        startTime: isoDateFormatter.date(from: "2023-11-09T10:00:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-09T10:15:00-06:00")!,
        stage: "",
        description:
"""
Plenary
"""
    )

    static let session15SecIntros = Session(
        id: "15-sec-intros",
        name: "15 sec Intro's",
        speakers: [
            rod,
            rockstar,
            mads
        ],
        startTime: isoDateFormatter.date(from: "2023-11-09T10:15:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-09T11:30:00-06:00")!,
        stage: "",
        description:
"""
Plenary
"""
    )

    static let sessionKeynoteWill = Session(
        id: "keynote-will",
        name: "Keynote - Will",
        speakers: [
            jb55
        ],
        startTime: isoDateFormatter.date(from: "2023-11-09T11:30:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-09T12:00:00-06:00")!,
        stage: "Event Space",
        description:
"""
Everyone - Event Space
"""
    )

    static let sessionLunch = Session(
        id: "lunch",
        name: "Lunch - Chivanada Food Truck (empanadas)",
        speakers: [

        ],
        startTime: isoDateFormatter.date(from: "2023-11-09T12:00:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-09T13:30:00-06:00")!,
        stage: "",
        description:
"""
Meal
"""
    )

    static let sessionPlebs = Session(
        id: "plebs",
        name: "Plebs",
        speakers: [
            rockstar,
            yegor,
            sersleepy,
            derekross,
            island
        ],
        startTime: isoDateFormatter.date(from: "2023-11-09T13:30:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-09T14:30:00-06:00")!,
        stage: "",
        description:
"""
Panel
"""
    )

    static let session10MinutePresentations = Session(
        id: "10-minute-presentations",
        name: "10 minute presentations",
        speakers: [
            avi,
            doc,
            derekross,
            tony,
            tyiu
        ],
        startTime: isoDateFormatter.date(from: "2023-11-09T14:30:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-09T15:30:00-06:00")!,
        stage: "",
        description:
"""
4 - 10 minute with 5 minute Q&A
"""
    )

    static let sessionOnboardingPeopleOnToNostr = Session(
        id: "onboarding-people-on-to-nostr",
        name: "Onboarding People on to Nostr",
        speakers: [
            tatum,
            island,
            doc,
            odell
        ],
        startTime: isoDateFormatter.date(from: "2023-11-09T15:30:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-09T16:30:00-06:00")!,
        stage: "Event Space",
        description:
"""
Breakout A - Event Space
"""
    )

    static let sessionNipsRoundtable = Session(
        id: "nips-roundtable",
        name: "NIPS Roundtable",
        speakers: [
            rockstar,
            miljan,
            jb55,
            tyiu
        ],
        startTime: isoDateFormatter.date(from: "2023-11-09T15:30:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-09T16:30:00-06:00")!,
        stage: "VIP Space",
        description:
"""
Breakout B - VIP Space
"""
    )

    static let sessionClosingKeynote1 = Session(
        id: "closing-keynote-1",
        name: "Closing Keynote",
        speakers: [
            rockstar
        ],
        startTime: isoDateFormatter.date(from: "2023-11-09T16:30:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-09T16:45:00-06:00")!,
        stage: "",
        description:
"""
"""
    )

    static let sessionLiveRabbitHoleRecapHappyHour = Session(
        id: "live-rabbit-hole-recap-happy-hour",
        name: "Live Rabbit Hole Recap + Happy Hour",
        speakers: [
        ],
        startTime: isoDateFormatter.date(from: "2023-11-09T16:45:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-09T18:00:00-06:00")!,
        stage: "",
        description:
"""
Networking
"""
    )

    static let sessionDinner = Session(
        id: "dinner",
        name: "Dinner - Chivanada Food Truck (empanadas)",
        speakers: [
        ],
        startTime: isoDateFormatter.date(from: "2023-11-09T18:00:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-09T20:00:00-06:00")!,
        stage: "",
        description:
"""
"""
    )

    static let sessionAfterparty = Session(
        id: "live-rabbit-hole-recap-happy-hour",
        name: "Live Rabbit Hole Recap + Happy Hour",
        speakers: [
        ],
        startTime: isoDateFormatter.date(from: "2023-11-09T20:00:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-09T23:00:00-06:00")!,
        stage: "Acme Feed and Seed",
        description:
"""
"""
    )

    static let sessionWelcome2 = Session(
        id: "welcome-2",
        name: "Welcome",
        speakers: [
            rod,
            rockstar
        ],
        startTime: isoDateFormatter.date(from: "2023-11-10T09:45:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-10T10:00:00-06:00")!,
        stage: "",
        description:
"""
"""
    )

    static let sessionNipsIrl = Session(
        id: "nips-irl",
        name: "NIPS IRL",
        speakers: [
            mads,
            roya,
            vanessa,
            susie
        ],
        startTime: isoDateFormatter.date(from: "2023-11-10T10:00:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-10T10:45:00-06:00")!,
        stage: "",
        description:
"""
"""
    )

    static let sessionWhyNostr = Session(
        id: "why-nostr",
        name: "Why Nostr",
        speakers: [
            preston,
            jb55,
            miljan,
            odell
        ],
        startTime: isoDateFormatter.date(from: "2023-11-10T10:45:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-10T11:30:00-06:00")!,
        stage: "",
        description:
"""
"""
    )

    static let sessionDamusBreakout = Session(
        id: "damus-breakout",
        name: "Damus Breakout",
        speakers: [
            jb55
        ],
        startTime: isoDateFormatter.date(from: "2023-11-10T11:30:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-10T12:30:00-06:00")!,
        stage: "VIP Space",
        description:
"""
Breakout B - VIP Space
"""
    )

    static let sessionPrimalBreakout = Session(
        id: "primal-breakout",
        name: "Primal Breakout",
        speakers: [
            miljan
        ],
        startTime: isoDateFormatter.date(from: "2023-11-10T11:30:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-10T12:30:00-06:00")!,
        stage: "Mezz",
        description:
"""
Breakout C - Mezz
"""
    )

    static let sessionClosingKeynote2 = Session(
        id: "closing-keynote-2",
        name: "Closing Keynote",
        speakers: [
            avi,
            corndalorian,
            quietWarrior
        ],
        startTime: isoDateFormatter.date(from: "2023-11-10T12:30:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-10T14:00:00-06:00")!,
        stage: "",
        description:
"""
Nostr Nests - Plebchain Radio
"""
    )

    static let sessions = [
        sessionWelcomeAndGoals,
        session15SecIntros,
        sessionKeynoteWill,
        sessionLunch,
        sessionPlebs,
        session10MinutePresentations,
        sessionOnboardingPeopleOnToNostr,
        sessionNipsRoundtable,
        sessionClosingKeynote1,
        sessionLiveRabbitHoleRecapHappyHour,
        sessionDinner,
        sessionAfterparty,
        sessionWelcome2,
        sessionNipsIrl,
        sessionWhyNostr,
        sessionDamusBreakout,
        sessionPrimalBreakout,
        sessionClosingKeynote2
    ]

    static let organizers = [
        rod,
        odell,
        mads,
        island
    ]

    static var previews: some View {
        ConferenceView(
            conference: nostrville2023
        )
    }
}
