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
}

#if DEBUG
let previewCharacter = Character(id: "Izuku_Midoriya",
                                 name: "Izuku Midoriya",
                                 alias: "Deku",
                                 affiliation: nil,
                                 birthday: nil,
                                 bloodtype: nil,
                                 description: nil,
                                 fightstyle: nil,
                                 gender: nil,
                                 eye: nil,
                                 hair: nil,
                                 kanji: nil,
                                 occupation: nil,
                                 quirk: nil,
                                 romaji: nil,
                                 status: nil,
                                 teams: nil,
                                 images: ["https://storage.googleapis.com/my-hero-academia-api/Izuku_Midoriya.jpg"],
                                 epithet: nil,
                                 ages: nil,
                                 family: nil)
#endif
