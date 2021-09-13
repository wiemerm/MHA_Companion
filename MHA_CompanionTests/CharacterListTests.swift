//
//  CharacterListTests.swift
//  MHA_CompanionTests
//
//  Created by Wiemer on 9/7/21.
//

@testable import MHA_Companion
import ViewInspector
import XCTest

class CharacterListTests: XCTestCase {
    func testContainsListOfCharactersAsNavigationLinks() {
        let deku = Character.deku()
        let characterList = CharacterList(characters: [deku], isLoading: false, onScrolledToBottom: {})
        XCTAssertNoThrow(try characterList.inspect().find(ViewType.List.self))
        XCTAssertNoThrow(try characterList.inspect().find(ViewType.ForEach.self))
        XCTAssertNoThrow(try characterList.inspect().find(navigationLink: deku.displayName).view(CharacterProfileView.self))
    }

    func testProgressViewDisplaysIfLoading() {
        let characterList = CharacterList(characters: [], isLoading: true, onScrolledToBottom: {})

        XCTAssertNoThrow(try characterList.inspect().find(ViewType.ProgressView.self))
    }
}
