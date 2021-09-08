//
//  Results.swift
//  MHA_Companion
//
//  Created by Wiemer on 9/1/21.
//

import Foundation

struct Results: Decodable {
    let currentPage: Int
    let count: Int
    let pages: Int
    let characters: [Character]

    enum CodingKeys: String, CodingKey {
        case info, result
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        characters = try container.decode([Character].self, forKey: .result)
        let info = try container.decode(Info.self, forKey: .info)
        currentPage = info.currentPage
        count = info.count
        pages = info.pages
    }

    init(currentPage: Int, count: Int, pages: Int, characters: [Character]) {
        self.currentPage = currentPage
        self.count = count
        self.pages = pages
        self.characters = characters
    }

    private class Info: Codable {
        let currentPage: Int
        let count: Int
        let pages: Int
    }
}
