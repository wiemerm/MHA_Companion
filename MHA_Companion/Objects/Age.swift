//
//  Age.swift
//  MHA_Companion
//
//  Created by Wiemer on 9/1/21.
//

import Foundation

struct Age: Codable, Equatable {
    let age: String
    var years: Int {
        Int(age.trimmingCharacters(in: .whitespacesAndNewlines)) ?? 0
    }
    let when: String
}
