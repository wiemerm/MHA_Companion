//
//  Constants.swift
//  MHA_Companion
//
//  Created by Wiemer on 9/7/21.
//

import Foundation
import SwiftUI

struct Constants {
    static let imageSize: CGFloat = 75
    static let cornerRadius: CGFloat = 10
}

struct Strings {
    static let placeholderAvatar = "person.fill"
}

extension Color {
    static let yellowText = Color(red: 255/255, green: 227/255, blue: 86/255)
    static let uaBlue = Color(red: 32/255, green: 38/255, blue: 77/255)
}

#if DEBUG
// swiftlint:disable line_length
let previewCharacter = Character(id: "Izuku_Midoriya",
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
#endif
