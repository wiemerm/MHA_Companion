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
}
