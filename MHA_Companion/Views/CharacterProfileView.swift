//
//  CharacterProfileView.swift
//  MHA_Companion
//
//  Created by Wiemer on 9/8/21.
//

import SwiftUI

struct CharacterProfileView: View {
    let character: Character

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    AvatarImage(imageUrl: character.avatarUrl, size: CGSize(width: 125, height: 125))
                    VStack(alignment: .leading) {
                        Text(character.displayName)
                            .font(.title)
                        if let alias = character.alias {
                            Text(alias)
                                .font(.title2)
                        }
                        if let birthday = character.birthday {
                            ProfileItemView(label: "Birthday", value: birthday)
                        }
                        if let age = character.ages?.last?.years {
                            ProfileItemView(label: "Age", value: "\(age)")
                        }
                        if let hair = character.hair {
                            ProfileItemView(label: "Hair", value: hair)
                        }
                        if let eyes = character.eye {
                            ProfileItemView(label: "Eyes", value: eyes)
                        }
                    }
                    .padding(.leading)
                    .frame(maxWidth: .infinity)
                    Spacer()
                }

                VStack(alignment: .leading) {
                    if let quirk = character.quirk {
                        ProfileItemView(label: "Quirk", value: quirk)
                    }
                    if let occupation = character.occupation {
                        ProfileItemView(label: "Occupation", value: occupation)
                    }
                    if let affiliation = character.affiliation {
                        ProfileItemView(label: "Affiliation", value: affiliation)
                    }
                    if let status = character.status {
                        ProfileItemView(label: "Status", value: status)
                    }
                }
                .frame(maxWidth: .infinity)

                Text(character.description ?? "No description available")
                    .padding()
                Spacer()
            }
        }
        .padding()
    }
}

struct CharacterProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterProfileView(character: previewCharacter)
    }
}
