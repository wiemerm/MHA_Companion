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
    let onScrolledToBottom: () -> Void

    var body: some View {
        List {
            ForEach(characters) { character in
                NavigationLink(destination: CharacterProfileView(character: character)) {
                    CharacterRow(character: character)
                        .onAppear {
                            if self.characters.last == character {
                                self.onScrolledToBottom()
                            }
                        }
                }
            }

            if isLoading {
                ProgressView()
            }
        }
    }
}

struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterList(characters: [], isLoading: false) { }
    }
}
