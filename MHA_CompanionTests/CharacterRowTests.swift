//
//  CharacterRowTests.swift
//  MHA_CompanionTests
//
//  Created by Wiemer on 9/3/21.
//

@testable import MHA_Companion
import XCTest
import ViewInspector

class CharacterRowTests: XCTestCase {
    func testRowContainsCorrectInfo_whenDataPresent() throws {
        let character = Character.testInstance(id: "Izuku_Midoriya",
                                               name: "Izuku Midoriya",
                                               alias: "Deku",
                                               affiliation: "U.A. High School",
                                               occupation: "Student",
                                               quirk: "One for All",
                                               images: ["https://storage.googleapis.com/my-hero-academia-api/Izuku_Midoriya.jpg"])
        let sut = CharacterRow(character: character)
        let inspection = try sut.inspect()

        XCTAssertNoThrow(try inspection.find(ViewType.HStack.self))

        XCTAssertNoThrow(try inspection.find(text: character.name!))
        XCTAssertNoThrow(try inspection.find(text: character.alias!))
        XCTAssertNoThrow(try inspection.find(text: character.affiliation!))
        XCTAssertNoThrow(try inspection.find(text: character.quirk!))
        XCTAssertNoThrow(try inspection.find(ViewType.Image.self))
    }

    func testRowContainsCorrectInfo_whenDataIsMissing() throws {
        let character = Character.testInstance(id: "Izuku_Midoriya",
                                               images: ["https://storage.googleapis.com/my-hero-academia-api/Izuku_Midoriya.jpg"])
        let sut = CharacterRow(character: character)
        let inspection = try sut.inspect()

        XCTAssertNoThrow(try inspection.find(ViewType.HStack.self))
        XCTAssertNoThrow(try inspection.find(text: character.id.replacingOccurrences(of: "_", with: " ")))
        XCTAssertEqual(inspection.findAll(ViewType.Text.self) { try $0.string() == "unknown" }.count, 4)
        XCTAssertNoThrow(try inspection.find(ViewType.Image.self))
    }
}
