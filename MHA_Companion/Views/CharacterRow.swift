//
//  CharacterRow.swift
//  MHA_Companion
//
//  Created by Wiemer on 9/3/21.
//

import SwiftUI

struct CharacterRow: View {
    @State private var avatar: UIImage?
    let character: Character

    var body: some View {
        HStack(alignment: .top) {
            AvatarImage(imageUrl: character.avatarUrl, size: CGSize(width: 75, height: 75))
            .padding(.trailing, 16)
            VStack(alignment: .leading) {
                Text(character.displayName)
                    .foregroundColor(.yellowText)
                Text(character.alias ?? "unknown")
                CharacterRowInfoView(label: "Affiliation", value: character.affiliation)
                CharacterRowInfoView(label: "Occupation", value: character.occupation)
                CharacterRowInfoView(label: "Quirk", value: character.quirk)
            }
        }
        .frame(height: 125)
    }
}

struct CharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRow(character: previewCharacter)
    }
}
