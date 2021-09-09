//
//  CharacterViewModelTests.swift
//  MHA_CompanionTests
//
//  Created by Wiemer on 9/9/21.
//

@testable import MHA_Companion
import Combine
import XCTest

class CharactersViewModelTests: XCTestCase {
    private var disposeBag = Set<AnyCancellable>()

    func testFetchCharactersStartsWithPageOne() {
        let service = MockCharacterService()
        let viewModel = CharactersViewModel(characterService: service)

        viewModel.fetchCharacters()

        XCTAssertEqual(service.fetchCharactersCallCount, 1)
        XCTAssertEqual(service.pageArg, 1)
    }

    func testFetchCharactersUpdatesStateWithResults() {
        let expect = expectation(description: "Waiting for state to change")
        let service = MockCharacterService()
        let viewModel = CharactersViewModel(characterService: service)

        let characters = [Character.testInstance(),
                          Character.testInstance(),
                          Character.testInstance()
        ]
        service.charactersResponse = characters

        viewModel.$state
            .removeDuplicates { $0.characters == $1.characters }
            .filter { !$0.characters.isEmpty }
            .sink { results in
                XCTAssertEqual(results.characters, characters)
                XCTAssertEqual(results.page, 2)
                expect.fulfill()
            }
            .store(in: &disposeBag)

        viewModel.fetchCharacters()

        wait(for: [expect], timeout: 0.5)
    }
}
