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
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image("deku")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 125, height: 125)
                    .cornerRadius(Constants.cornerRadius)
//                AvatarImage(imageUrl: character.avatarUrl)
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
                    if let hair = character.hair {
                        ProfileItemView(label: "Hair", value: hair)
                    }
                    if let eyes = character.eye {
                        ProfileItemView(label: "Eyes", value: eyes)
                    }
                }.padding(.leading)
                Spacer()
            }.padding(.horizontal)

            VStack {
                if let occupation = character.occupation {
                    ProfileItemView(label: "Occupation", value: occupation)
                        .foregroundColor(.uaBlue)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: Constants.cornerRadius)
                            .foregroundColor(.yellowText)
            )
            .padding()

            Text(character.description ?? "No description available")
                .padding()
            Spacer()
        }
    }
}

struct CharacterProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterProfileView(character: previewCharacter)
    }
}
