//
//  CharacterList.swift
//  MHA_Companion
//
//  Created by Wiemer on 9/3/21.
//

import SwiftUI

struct CharacterList: View {
    let characters: [Character]
    let isLoading: Bool
    let onScolledToBottom: () -> Void

    var body: some View {
        ForEach(characters) { character in
            Text(character.name ?? character.id)
        }
    }
}

struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterList(characters: [Character(id: "Izuku_Midoriya",
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
                                             family: nil)],
                      isLoading: false) { }
    }
}
