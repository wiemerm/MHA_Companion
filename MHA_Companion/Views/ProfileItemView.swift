//
//  ProfileItemView.swift
//  MHA_Companion
//
//  Created by Wiemer on 9/8/21.
//

import SwiftUI

struct ProfileItemView: View {
    let label: String
    let value: String?

    var body: some View {
        HStack(alignment: .top) {
            Text("\(label):")
            Text(value ?? "unknown")
        }
    }
}

struct ProfileItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileItemView(label: "Quirk", value: "One for All")
    }
}
