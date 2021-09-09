//
//  CharacterListViewModel.swift
//  MHA_Companion
//
//  Created by Wiemer on 9/7/21.
//

import Combine
import Foundation

class CharactersViewModel: ObservableObject {
    @Published var state = State()

    private let characterService: CharacterServiceProtocol
    private var disposeBag = Set<AnyCancellable>()

    init(characterService: CharacterServiceProtocol = CharacterService()) {
        self.characterService = characterService
    }

    func fetchCharacters() {
        guard state.canLoad else { return }

        characterService.fetchCharacters(page: state.page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                    case .finished: break
                    case .failure: self?.state.canLoad = false
                }
            }) { [weak self] results in
                guard let _self = self else { return }
                _self.state.page += 1
                _self.state.canLoad = results.currentPage < results.pages
                _self.state.characters.append(contentsOf: results.characters)
            }
            .store(in: &disposeBag)
    }

    struct State {
        var characters = [Character]()
        var page: Int = 1
        var canLoad = true
    }
}
