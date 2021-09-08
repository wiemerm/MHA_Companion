//
//  ContentView.swift
//  MHA_Companion
//
//  Created by Wiemer on 9/1/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CharactersViewModel()
    var body: some View {
        NavigationView {
            CharacterList(characters: viewModel.state.characters, isLoading: viewModel.state.canLoad) {
                viewModel.fetchCharacters()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("mha_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                        .padding(.bottom)
                }
            }
            .onAppear { viewModel.fetchCharacters() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
