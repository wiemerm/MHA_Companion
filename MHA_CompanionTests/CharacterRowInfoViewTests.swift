//
//  CharacterRowInfoViewTests.swift
//  MHA_CompanionTests
//
//  Created by Wiemer on 9/3/21.
//
@testable import MHA_Companion
import XCTest
import ViewInspector

class CharacterRowInfoViewTests: XCTestCase {
    func testViewDisplaysCorrectValues_whenPassedNonNil() {
        let sut = CharacterRowInfoView(label: "Quirk", value: "Half-Cold Half-Hot")
        XCTAssertNoThrow(try sut.inspect().find(ViewType.HStack.self))
        XCTAssertNoThrow(try sut.inspect().find(text: "Quirk:"))
        XCTAssertNoThrow(try sut.inspect().find(text: "Half-Cold Half-Hot"))
    }

    func testViewDisplaysCorrectValues_whenPassedNil() {
        let sut = CharacterRowInfoView(label: "Quirk", value: nil)
        XCTAssertNoThrow(try sut.inspect().find(ViewType.HStack.self))
        XCTAssertNoThrow(try sut.inspect().find(text: "Quirk:"))
        XCTAssertNoThrow(try sut.inspect().find(text: "unknown"))
    }
}
