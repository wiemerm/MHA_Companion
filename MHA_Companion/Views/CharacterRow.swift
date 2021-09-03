//
//  CharacterRow.swift
//  MHA_Companion
//
//  Created by Wiemer on 9/3/21.
//

import SwiftUI

struct CharacterRow: View {
    let character: Character

    var body: some View {
        HStack {
//            Image(uiImage: ) // for when loading the actual image; get rid of background then too
            Image(systemName: "bolt")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(4)
                .background(Color.blue)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(character.name ?? character.id)
                Text(character.alias ?? "unknown")
                CharacterRowInfoView(label: "Affiliation", value: character.affiliation)
                CharacterRowInfoView(label: "Occupation", value: character.occupation)
                CharacterRowInfoView(label: "Quirk", value: character.quirk)
            }
        }.frame(height: 125)
    }
}

struct CharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRow(character: Character(id: "Izuku_Midoriya",
                                          name: "Izuku Midoriya",
                                          alias: "Deku",
                                          affiliation: nil,
                                          birthday: nil,
                                          bloodtype: nil,
                                          description: nil,
                                          fightstyle: nil,
                                          gender: nil,
                                          Eye: nil,
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
                                          family: nil))
    }
}
