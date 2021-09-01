//
//  CharacterEndpointsTests.swift
//  MHA_CompanionTests
//
//  Created by Wiemer on 9/1/21.
//

@testable import MHA_Companion
import XCTest

class CharacterEndpointsTests: XCTestCase {
    func testCanBuildURL_allCase() {
        let url = CharacterEndpoints.all.url
        XCTAssertNotNil(url)
        XCTAssertEqual(url?.absoluteString, "https://myheroacademiaapi.com/api/character")
    }

    func testCanBuildURL_forSpecificPageOfCharacters() {
        let url = CharacterEndpoints.page(5).url
        XCTAssertNotNil(url)
        XCTAssertEqual(url?.absoluteString, "https://myheroacademiaapi.com/api/character?page=5")
    }

    func testCanBuildURL_forSpecificCharacter() {
        let url = CharacterEndpoints.character(id: "Shoto_Todoroki").url
        XCTAssertNotNil(url)
        XCTAssertEqual(url?.absoluteString, "https://myheroacademiaapi.com/api/character/Shoto_Todoroki")
    }

    func testCanBuildURL_filteringByName() {
        let url = CharacterEndpoints.filter(by: .name, value: "Toshinori Yagi").url
        XCTAssertNotNil(url)
        XCTAssertEqual(url?.absoluteString, "https://myheroacademiaapi.com/api/character?name=Toshinori%20Yagi")
    }

    func testCanBuildURL_filteringByAlias() {
        let url = CharacterEndpoints.filter(by: .alias, value: "All Might").url
        XCTAssertNotNil(url)
        XCTAssertEqual(url?.absoluteString, "https://myheroacademiaapi.com/api/character?alias=All%20Might")
    }

    func testCanBuildURL_filteringByQuirk() {
        let url = CharacterEndpoints.filter(by: .quirk, value: "hardening").url
        XCTAssertNotNil(url)
        XCTAssertEqual(url?.absoluteString, "https://myheroacademiaapi.com/api/character?quirk=hardening")
    }

    func testCanBuildURL_filteringByOccupation() {
        let url = CharacterEndpoints.filter(by: .occupation, value: "student").url
        XCTAssertNotNil(url)
        XCTAssertEqual(url?.absoluteString, "https://myheroacademiaapi.com/api/character?occupation=student")
    }

    func testCanBuildURL_filteringByAffiliation() {
        let url = CharacterEndpoints.filter(by: .affiliation, value: "U.A. High School").url
        XCTAssertNotNil(url)
        XCTAssertEqual(url?.absoluteString, "https://myheroacademiaapi.com/api/character?affiliation=U.A.%20High%20School")

    }
}