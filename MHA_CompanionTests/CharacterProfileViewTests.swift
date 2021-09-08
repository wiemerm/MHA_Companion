//
//  CharacterProfileViewTests.swift
//  MHA_CompanionTests
//
//  Created by Wiemer on 9/8/21.
//

@testable import MHA_Companion
import ViewInspector
import XCTest

class CharacterProfileViewTests: XCTestCase {
    func testProfileContainsRequiredInfo() {
        let character = Character.testInstance()
        let characterView = try? CharacterProfileView(character: character).inspect()

        XCTAssertNoThrow(try characterView?.find(ViewType.Image.self))
        XCTAssertNoThrow(try characterView?.find(text: character.id))
        XCTAssertEqual(characterView?.findAll(ViewType.Text.self).count, 1)
    }

    func testProfile_whenAllFieldsPresent() {
        let character = Character.deku()
        let characterView = try? CharacterProfileView(character: character).inspect()

        XCTAssertNoThrow(try characterView?.find(ViewType.Image.self))
        XCTAssertNoThrow(try characterView?.find(text: character.name!))
        XCTAssertNoThrow(try characterView?.find(text: "Alias:"))
        XCTAssertNoThrow(try characterView?.find(text: character.alias!))
        XCTAssertNoThrow(try characterView?.find(text: "Birthday:"))
        XCTAssertNoThrow(try characterView?.find(text: character.birthday!))
    }
}
