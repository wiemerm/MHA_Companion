//
//  TestInstances.swift
//  MHA_CompanionTests
//
//  Created by Wiemer on 9/3/21.
//

@testable import MHA_Companion
import Foundation

extension Character {
    static func testInstance(id: String = UUID().uuidString,
                             name: String? = nil,
                             alias: String? = nil,
                             affiliation: String? = nil,
                             birthday: String? = nil,
                             bloodtype: String? = nil,
                             description: String? = nil,
                             fightstyle: String? = nil,
                             gender: String? = nil,
                             eye: String? = nil,
                             hair: String? = nil,
                             kanji: String? = nil,
                             occupation: String? = nil,
                             quirk: String? = nil,
                             romaji: String? = nil,
                             status: String? = nil,
                             teams: String? = nil,
                             images: [String] = [],
                             epithet: String? = nil,
                             ages: [Age]? = nil,
                             family: [FamilyMember]? = nil) -> Character {
        Character(id: id,
                  name: name,
                  alias: alias,
                  affiliation: affiliation,
                  birthday: birthday,
                  bloodtype: bloodtype,
                  description: description,
                  fightstyle: fightstyle,
                  gender: gender,
                  eye: eye,
                  hair: hair,
                  kanji: kanji,
                  occupation: occupation,
                  quirk: quirk,
                  romaji: romaji,
                  status: status,
                  teams: teams,
                  images: images,
                  epithet: epithet,
                  ages: ages,
                  family: family)
    }

    static func deku() -> Character {
        Character(id: "Izuku_Midoriya",
                  name: "Izuku Midoriya",
                  alias: "Deku",
                  affiliation: "U.A. High School",
                  birthday: "July 15",
                  bloodtype: "O",
                  description: "Izuku Midoriya (緑 (みどり) 谷 (や) 出 (いず) 久 (く) , Midoriya Izuku?), also known as Deku (デク, Deku?), is the primary protagonist of the My Hero Academia manga and anime series.\nThough born Quirkless, Izuku manages to catch the attention of the legendary hero All Might due to his innate heroism and strong sense of justice and has since become his close pupil as well as a student in Class 1-A at U.A. High School. All Might passed on his Quirk to Izuku, making him the ninth holder of One For All.\n",
                  fightstyle: "Shoot Style",
                  gender: "Male",
                  eye: "Green",
                  hair: "Green",
                  kanji: "緑 (みどり) 谷 (や) 出 (いず) 久 (く) ",
                  occupation: "Student",
                  quirk: "Quirkless, One For All, Blackwhip",
                  romaji: "Midoriya Izuku",
                  status: "Alive",
                  teams: "Team Midoriya (Leader), Shie Hassaikai Raid Team",
                  images: [
                    "https://storage.googleapis.com/my-hero-academia-api/Izuku_Midoriya-1.jpg",
                    "https://storage.googleapis.com/my-hero-academia-api/Izuku_Midoriya-2.jpg",
                    "https://storage.googleapis.com/my-hero-academia-api/Izuku_Midoriya-3.jpg",
                    "https://storage.googleapis.com/my-hero-academia-api/Izuku_Midoriya.jpg"
                    ],
                  epithet: "Next Symbol of Peace",
                  ages: [
                    Age(age: "4", when: "First Appearance"),
                    Age(age: "14", when: "Chapter 1-2"),
                    Age(age: "15", when: "Chapter 3 to Provisional Hero License Exam Arc"),
                    Age(age: "16", when: "Current")
                  ],
                  family: [
                    FamilyMember(id: "Inko_Midoriya", name: "Inko Midoriya"),
                    FamilyMember(id: "Hisashi_Midoriya", name: "Hisashi Midoriya")
                  ])
    }
}

extension Results {
    static func testInstance(currentPage: Int = 1,
                             count: Int = 1,
                             pages: Int = 1,
                             characters: [Character] = []) -> Results {
        Results(currentPage: currentPage,
                count: count,
                pages: pages,
                characters: characters)
    }
}
