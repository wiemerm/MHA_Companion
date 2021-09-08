//
//  CharacterRowInfoView.swift
//  MHA_Companion
//
//  Created by Wiemer on 9/3/21.
//

import SwiftUI

struct CharacterRowInfoView: View {
    let label: String
    let value: String?

    var body: some View {
        HStack {
            Text("\(label):")
                .font(.system(size: 12))
            Text(value ?? "unknown")
                .foregroundColor(.yellowText)
                .font(.system(size: 12))
        }
    }
}

struct CharacterRowInfoView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CharacterRowInfoView(label: "Occupation", value: "Villain")
            CharacterRowInfoView(label: "Quirk", value: nil)
        }
    }
}
