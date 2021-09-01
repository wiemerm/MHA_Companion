//
//  Character.swift
//  MHA_Companion
//
//  Created by Wiemer on 9/1/21.
//

import Foundation

struct Character: Codable {
    let id: String
    let name: String?
    let alias: String?
    let affiliation: String?
    let birthday: String?
    let bloodtype: String?
    let description: String?
    let fightstyle: String?
    let gender: String?
    let Eye: String?
    let hair: String?
    let kanji: String?
    let occupation: String?
    let quirk: String?
    let romaji: String?
    let status: String?
    let teams: String?
    let images: [String]
    let epithet: String?
    let ages: [Age]?
    let family: [FamilyMember]?
}
