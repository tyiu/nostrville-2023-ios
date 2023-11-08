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
                organizers: conference.organizers,
                volunteers: conference.volunteers
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
        timeZone: TimeZone(identifier: "America/Indiana/Tell_City") ?? TimeZone.current,
        sessions: sessions,
        organizers: organizers,
        volunteers: volunteers
    )

    static let avi = Person(
        nostrPublicKey: "npub1hqaz3dlyuhfqhktqchawke39l92jj9nt30dsgh2zvd9z7dv3j3gqpkt56s",
        name: "Avi Burra",
        description: "Bitcoin Surrealist",
        picture: "avi",
        lightningIdentifier: "weirdparsnip79@walletofsatoshi.com"
    )

    static let david = Person(
        nostrPublicKey: "npub1u5njm6g5h5cpw4wy8xugu62e5s7f6fnysv0sj0z3a8rengt2zqhsxrldq3",
        name: "David Strayhorn",
        description:
"""
builder of Pretty Good Apps
GitHub.com/wds4/pretty-good

DCoSL: decentralized curation of simple lists
GitHub.com/wds4/DCoSL
""",
        picture: "david",
        lightningIdentifier: "LNURL1DP68GURN8GHJ7AMPD3KX2AR0VEEKZAR0WD5XJTNRDAKJ7TNHV4KXCTTTDEHHWM30D3H82UNVWQHH2MN4WDJKGANFDAKXZWPKY4NTAH"
    )

    static let derekross = Person(
        nostrPublicKey: "npub18ams6ewn5aj2n3wt2qawzglx9mr4nzksxhvrdc4gzrecw7n5tvjqctp424",
        name: "Derek Ross",
        description: "Bitcoiner. Drinker of delicious beer. Cast iron skillet lover. Systems Administrator. Building NostrPlebs.com and NostrNests.com",
        picture: "derekross",
        lightningIdentifier: "derekross@getalby.com"
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
        lightningIdentifier: "0x72078c6c7c3e4026@ln.tips"
    )

    static let elsat = Person(
        nostrPublicKey: "npub1zafcms4xya5ap9zr7xxr0jlrtrattwlesytn2s42030lzu0dwlzqpd26k5",
        name: "elsat",
        description:
"""
Damus and nostr Product Janitor 🧹
Zaps go to Bitcoin Berlin 🇸🇻 bitcoinberlin@blink.sv
""",
        picture: "elsat",
        lightningIdentifier: "bitcoinberlin@blink.sv"
    )

    static let frankee = Person(
        nostrPublicKey: "npub16ama28wlhl5rsl8l9eqr8tgarmjg638hxnqgv6q7cte4z7ru5j7qt60tmx",
        name: "frankee.hodl",
        description: nil,
        picture: "frankee",
        lightningIdentifier: "obtusenut96@walletofsatoshi.com"
    )

    static let getOffZero = Person(
        nostrPublicKey: "npub1hvqyjkwaprl5k28csax7g8c20xsyw0nqnavwmlkz956h986dx9ashagyq6",
        name: "GetOffZero",
        description:
"""
Romans 1:16 & BTC Believer | Bitcoin Class of 2017

Bitcoin is the life raft but you have to get in—Get Off Zero

First Principle: If Your Life Is A Mess, Bitcoin Will Not Fix This
""",
        picture: "getOffZero",
        lightningIdentifier: "shyangle36@walletofsatoshi.com"
    )

    static let gratten = Person(
        nostrPublicKey: "npub1s9yysustct27xeah0v0kvdalwrqx7e8x8vw2xa2ph7mt2mep3rfqpupwct",
        name: "Gratten",
        description: "Bitcoin enthusiast and tinkerer",
        picture: "gratten",
        lightningIdentifier: "gratten@gratten.duckdns.org"
    )

    static let island = Person(
        nostrPublicKey: "npub1jzuma368395gu523y4vk4d34p0lxgctk436hggn4qcuj93075qgqtn3vm0",
        name: "island",
        description: "₿ |⚡️| @Bitcoin Park | #nostrica | #nodestrich | #bitcoin2023 | #btcprague | #BH2023 | #TABconf | #nostrasia | primal.net/island",
        picture: "island",
        lightningIdentifier: "island@walletofsatoshi.com"
    )

    static let dontGrowWeary = Person(
        nostrPublicKey: "npub1jv6j6dpum7dgrdn8jm5gqnt5vv3g4eqfj55etgxsaa56dnkp3smq67g7he",
        name: "Don't Grow Weary",
        description: "Jesus | Bitcoin | Beef | Ops at Voltage",
        picture: "dontGrowWeary",
        lightningIdentifier: "dontgrowweary@vlt.ge"
    )

    static let josh = Person(
        nostrPublicKey: "npub1jv6j6dpum7dgrdn8jm5gqnt5vv3g4eqfj55etgxsaa56dnkp3smq67g7he",
        name: "JoshBitcoinPark",
        description: "Community & Ops | Bitcoin Park",
        picture: "josh",
        lightningIdentifier: nil
    )

    static let mads = Person(
        nostrPublicKey: "npub1rpes5hhk6mxun5ddt5kecxfm8y3xdr0h5jwal32mc6mxafr48hxsaj2et2",
        name: "mads",
        description: "Running bitcoin & ⚡️",
        picture: "mads",
        lightningIdentifier: "mads@getalby.com"
    )

    static let marty = Person(
        nostrPublicKey: "npub1guh5grefa7vkay4ps6udxg8lrqxg2kgr3qh9n4gduxut64nfxq0q9y6hjy",
        name: "Marty Bent",
        description: "Founder of TFTC.io, co-host of Rabbit Hole Recap, Partner at Ten31",
        picture: "marty",
        lightningIdentifier: "marty@getalby.com"
    )

    static let mjgbtc = Person(
        nostrPublicKey: "npub17tzr4dh0y66yj9g7flmf74uerwfp4wwhf86xcl328e65l3v504dqsy90sg",
        name: "MJGBTC",
        description: nil,
        picture: "mjgbtc",
        lightningIdentifier: "dawnriver630504@getalby.com"
    )

    static let odell = Person(
        nostrPublicKey: "npub1qny3tkh0acurzla8x3zy4nhrjz5zd8l9sy9jys09umwng00manysew95gx",
        name: "ODELL",
        description: "freedom tech is hope 🫡",
        picture: "odell",
        lightningIdentifier: "odell@vlt.ge"
    )

    static let preston = Person(
        nostrPublicKey: "npub1s5yq6wadwrxde4lhfs56gn64hwzuhnfa6r9mj476r5s4hkunzgzqrs6q7z",
        name: "preston",
        description: "Bitcoin & books. My bitcoin can remain in cold storage far longer than the market can remain irrational. @PrestonPysh on Twitter.",
        picture: "preston",
        lightningIdentifier: "prestonpysh@getalby.com"
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
        lightningIdentifier: "QW@WalletOfSatoshi.com"
    )

    static let rockstar = Person(
        nostrPublicKey: "npub1j8y6tcdfw3q3f3h794s6un0gyc5742s0k5h5s2yqj0r70cpklqeqjavrvg",
        name: "Uncle Rockstar",
        description: "#Bitcoin Uncle. Core contributor @BtcPayServer. Philosopher, Cypherpunk, Unifier. Short Twitter (and other BS), Long Nostr!",
        picture: "rockstar",
        lightningIdentifier: "rockstar@snort.social"
    )

    static let rod = Person(
        nostrPublicKey: "npub1atn7mlwt08erz4ap47gef92xfey65a4z9ed9vec53u5kc9v94pusl6h4x3",
        name: "Rod",
        description: "Nostrville 2023 🧡",
        picture: "rod",
        lightningIdentifier: "bitkite@getalby.com"
    )

    static let roya = Person(
        nostrPublicKey: "npub1csamkk8zu67zl9z4wkp90a462v53q775aqn5q6xzjdkxnkvcpd7srtz4x9",
        name: "roya",
        description: "",
        picture: "roya",
        lightningIdentifier: "roya@getalby.com"
    )

    static let sersleepy = Person(
        nostrPublicKey: "npub1jk9h2jsa8hjmtm9qlcca942473gnyhuynz5rmgve0dlu6hpeazxqc3lqz7",
        name: "Ser Sleepy",
        description: "A frog of many trades 🐸",
        picture: "sersleepy",
        lightningIdentifier: "sersleepy@getalby.com"
    )

    static let seth = Person(
        nostrPublicKey: "npub15u3cqhx6vuj3rywg0ph5mfv009lxja6cyvqn2jagaydukq6zmjwqex05rq",
        name: "Seth",
        description:
"""
Nostr & Bitcoin

https://nostr.cooking

https://nostrlobby.com
""",
        picture: "seth",
        lightningIdentifier: "LNURL1DP68GURN8GHJ7AMPD3KX2AR0VEEKZAR0WD5XJTNRDAKJ7TNHV4KXCTTTDEHHWM30D3H82UNVWQHKCMMWV4K8JETJVYCRGZDTUUE"
    )

    static let smash = Person(
        nostrPublicKey: "npub1c9y08cwk9wfgsks34zvdmy8awpzgrg5razl77h49n0p0jkp7jpfqln988d",
        name: "Smash",
        description: nil,
        picture: "smash",
        lightningIdentifier: "lnurl1dp68gurn8ghj7ampd3kx2ar0veekzar0wd5xjtnrdakj7tnhv4kxctttdehhwm30d3h82unvwqhhxmtpwf6x2unrdpskucm9xvcsqrl8pz"
    )

    static let susie = Person(
        nostrPublicKey: "npub1jt0x3vsnqtazzda3ewa8ykdch2t8k566qhrd9vyy0k0ntleu744q8h6q3n",
        name: "Susiebdds",
        description: "The artist formerly known as Beefybush79@walletofsatoshi.com",
        picture: "susie",
        lightningIdentifier: "beefybush69@walletofsatoshi.com"
    )

    static let timot = Person(
        nostrPublicKey: "npub1x8gwn5x96xwsedtde630p5yp4hwq5l6rqhvzutsnx3clle92vdks8rtv28",
        name: "Timot",
        description: nil,
        picture: "timot",
        lightningIdentifier: "boldrain193@getalby.com"
    )

    static let tony = Person(
        nostrPublicKey: "npub1t0nyg64g5vwprva52wlcmt7fkdr07v5dr7s35raq9g0xgc0k4xcsedjgqv",
        name: "Tony",
        description: "Building Mutiny Wallet",
        picture: "tony",
        lightningIdentifier: "TonyGiorgio@stacker.news"
    )

    static let tyiu = Person(
        nostrPublicKey: "npub1yaul8k059377u9lsu67de7y637w4jtgeuwcmh5n7788l6xnlnrgs3tvjmf",
        name: "Terry Yiu",
        description: "Founder @ Confstr\nContributor @ Damus\nEngineer @ Cash App",
        picture: "tyiu",
        lightningIdentifier: "tyiu@tyiu.xyz"
    )

    static let w3irdrobot = Person(
        nostrPublicKey: "npub17q5n2z8naw0xl6vu9lvt560lg33pdpe29k0k09umlfxm3vc4tqrq466f2y",
        name: "W3irdrobot",
        description: "send nodes",
        picture: "w3irdrobot",
        lightningIdentifier: "w3irdrobot@vlt.ge"
    )

    static let yegor = Person(
        nostrPublicKey: "npub1z4m7gkva6yxgvdyclc7zp0vz4ta0s2d9jh8g83w03tp5vdf3kzdsxana6p",
        name: "yegorpetrov",
        description: "#Bitcoin 🧡 #nostr 💜",
        picture: "yegor",
        lightningIdentifier: "yegorpetrov@getalby.com"
    )

    static let zach = Person(
        nostrPublicKey: "npub1zach44xjpc4yyhx6pgse2cj2pf98838kja03dv2e8ly8lfr094vqvm5dy5",
        name: "Zach Meyer",
        description: "Writing code and stacking sats for fun and profit 🦤",
        picture: "zach",
        lightningIdentifier: "polishedsun243004@getalby.com"
    )

    static let sessionWelcomeAndGoals = Session(
        id: "welcome-and-goals",
        name: "Welcome and Goals",
        speakers: [
            rod,
            rockstar,
            mads,
            yegor
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

    static let sessionKeynote = Session(
        id: "keynote",
        name: "Keynote",
        speakers: [
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
        name: "Lunch",
        speakers: [],
        startTime: isoDateFormatter.date(from: "2023-11-09T12:00:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-09T13:30:00-06:00")!,
        stage: "Pop-Up at Park + Hillsboro Village",
        description:
"""
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

    static let session10MinutePresentations1 = Session(
        id: "10-minute-presentations-1",
        name: "10 minute presentations",
        speakers: [
            derekross,
            doc,
            tony,
            tyiu
        ],
        startTime: isoDateFormatter.date(from: "2023-11-09T14:30:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-09T15:30:00-06:00")!,
        stage: "",
        description:
"""
4 - 10 minute with 5 minute Q&A

Derek - Nostr Nests
Doc - NostrReport
Tony - Mutiny
Terry Yiu - Confstr
"""
    )

    static let sessionOnboardingPeopleOnToNostr = Session(
        id: "onboarding-people-on-to-nostr",
        name: "Onboarding People on to Nostr",
        speakers: [
            roya,
            island,
            doc,
            odell
        ],
        startTime: isoDateFormatter.date(from: "2023-11-09T15:30:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-09T16:30:00-06:00")!,
        stage: "Breakout A - Event Space",
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
            elsat,
            tyiu
        ],
        startTime: isoDateFormatter.date(from: "2023-11-09T15:30:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-09T16:30:00-06:00")!,
        stage: "Breakout B - VIP Space",
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
            odell,
            marty
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
        name: "Dinner",
        speakers: [
        ],
        startTime: isoDateFormatter.date(from: "2023-11-09T18:00:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-09T20:00:00-06:00")!,
        stage: "TBD",
        description:
"""
"""
    )

    static let sessionAfterparty = Session(
        id: "afterparty",
        name: "Afterparty",
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
            odell
        ],
        startTime: isoDateFormatter.date(from: "2023-11-10T10:45:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-10T11:30:00-06:00")!,
        stage: "",
        description:
"""
"""
    )

    static let session10MinutePresentations2 = Session(
        id: "10-minute-presentations-2",
        name: "10 minute presentations",
        speakers: [
            zach,
            seth,
            david,
            dontGrowWeary,
            w3irdrobot
        ],
        startTime: isoDateFormatter.date(from: "2023-11-10T11:30:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-10T12:30:00-06:00")!,
        stage: "Event Space",
        description:
"""
4 - 10 minute with 5 minute Q&A

Zach - Flockstr
Seth - nostr.cooking
David Strayhorn - Pretty Good
Don't Grow Weary, w3irdrobot - Voltage
"""
    )

    static let sessionDamusBreakout = Session(
        id: "damus-breakout",
        name: "Damus Breakout",
        speakers: [
            elsat
        ],
        startTime: isoDateFormatter.date(from: "2023-11-10T11:30:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-10T12:30:00-06:00")!,
        stage: "Breakout C - Mezz",
        description:
"""
"""
    )

    static let sessionNostrasia = Session(
        id: "nostrasia",
        name: "Nostrasia",
        speakers: [
            rockstar
        ],
        startTime: isoDateFormatter.date(from: "2023-11-10T11:30:00-06:00")!,
        endTime: isoDateFormatter.date(from: "2023-11-10T12:30:00-06:00")!,
        stage: "Breakout B - VIP Space",
        description:
"""
"""
    )

    static let sessionClosingKeynote2 = Session(
        id: "closing-keynote-2",
        name: "Closing Keynote",
        speakers: [
            avi,
            doc,
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
        sessionKeynote,
        sessionLunch,
        sessionPlebs,
        session10MinutePresentations1,
        sessionOnboardingPeopleOnToNostr,
        sessionNipsRoundtable,
        sessionClosingKeynote1,
        sessionLiveRabbitHoleRecapHappyHour,
        sessionDinner,
        sessionAfterparty,
        sessionWelcome2,
        sessionNipsIrl,
        sessionWhyNostr,
        session10MinutePresentations2,
        sessionNostrasia,
        sessionDamusBreakout,
        sessionClosingKeynote2
    ]

    static let organizers = [
        rod,
        odell,
        mads,
        island,
        yegor
    ]

    static let volunteers = [
        frankee,
        getOffZero,
        gratten,
        josh,
        mjgbtc,
        smash,
        timot,
        tyiu
    ]

    static var previews: some View {
        ConferenceView(
            conference: nostrville2023
        )
    }
}
