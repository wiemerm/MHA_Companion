//
//  CharacterTests.swift
//  MHA_CompanionTests
//
//  Created by Wiemer on 9/1/21.
//

@testable import MHA_Companion
import XCTest

class CharacterTests: XCTestCase {
    func testDecoding_throwsKeyNotFound_whenMissingId() {
        XCTAssertThrowsError(try JSONDecoder().decode(Character.self, from: characterMissingId)) { error in
            if case .keyNotFound(let key, _)? = error as? DecodingError {
                XCTAssertEqual("id", key.stringValue)
            } else {
                XCTFail("Expected '.keyNotFound' but received \(error)")
            }
        }
    }

    func testDecoding_throwsKeyNotFound_whenMissingImages() {
        XCTAssertThrowsError(try JSONDecoder().decode(Character.self, from: characterMissingImages)) { error in
            if case .keyNotFound(let key, _)? = error as? DecodingError {
                XCTAssertEqual("images", key.stringValue)
            } else {
                XCTFail("Expected '.keyNotFound' but received \(error)")
            }
        }
    }

    func testDecoding_whenNoOptionalFieldsExist() {
        let result = try? JSONDecoder().decode(Character.self, from: characterMissingAllOptionalFields)

        XCTAssertNotNil(result)
        XCTAssertEqual(result?.id, "Eijiro_Kirishima")
        XCTAssertEqual(result?.images.count, 4)
    }

    func testDecoding_whenAllFieldsExist() {
        let result = try? JSONDecoder().decode(Character.self, from: characterContainingAllFields)

        XCTAssertNotNil(result)
        XCTAssertEqual(result?.id, "Izuku_Midoriya")
        XCTAssertEqual(result?.images.count, 4)
        XCTAssertEqual(result?.name, "Izuku Midoriya")
        XCTAssertEqual(result?.alias, "Deku")
        XCTAssertEqual(result?.affiliation, "U.A. High School")
        XCTAssertEqual(result?.birthday, "July 15")
        XCTAssertEqual(result?.bloodtype, "O")
        XCTAssertEqual(result?.description, "Izuku Midoriya (緑 (みどり) 谷 (や) 出 (いず) 久 (く) , Midoriya Izuku?), also known as Deku (デク, Deku?), is the primary protagonist of the My Hero Academia manga and anime series.\nThough born Quirkless, Izuku manages to catch the attention of the legendary hero All Might due to his innate heroism and strong sense of justice and has since become his close pupil as well as a student in Class 1-A at U.A. High School. All Might passed on his Quirk to Izuku, making him the ninth holder of One For All.\n")
        XCTAssertEqual(result?.fightstyle, "Shoot Style")
        XCTAssertEqual(result?.gender, "Male")
        XCTAssertEqual(result?.eye, "Green")
        XCTAssertEqual(result?.hair, "Green")
        XCTAssertEqual(result?.kanji, "緑 (みどり) 谷 (や) 出 (いず) 久 (く) ")
        XCTAssertEqual(result?.occupation, "Student")
        XCTAssertEqual(result?.quirk, "Quirkless, One For All, Blackwhip")
        XCTAssertEqual(result?.romaji, "Midoriya Izuku")
        XCTAssertEqual(result?.status, "Alive")
        XCTAssertEqual(result?.teams, "Team Midoriya (Leader), Shie Hassaikai Raid Team")
        XCTAssertEqual(result?.epithet, "New Symbol of Peace")
        XCTAssertEqual(result?.ages?.count, 4)
        XCTAssertEqual(result?.family?.count, 2)
    }
}

private let characterMissingId = Data("""
    {
        "name": "Eijiro Kirishima",
        "alias": "Sturdy Hero: Red Riot",
        "images": [
            "https://storage.googleapis.com/my-hero-academia-api/Eijiro_Kirishima-1.jpg",
            "https://storage.googleapis.com/my-hero-academia-api/Eijiro_Kirishima-2.jpg",
            "https://storage.googleapis.com/my-hero-academia-api/Eijiro_Kirishima-3.jpg",
            "https://storage.googleapis.com/my-hero-academia-api/Eijiro_Kirishima.jpg"
        ]
    }
""".utf8)

private let characterMissingImages = Data("""
    {
        "id": "Eijiro_Kirishima",
        "name": "Eijiro Kirishima",
        "alias": "Sturdy Hero: Red Riot"
    }
""".utf8)

private let characterMissingAllOptionalFields = Data("""
    {
        "id": "Eijiro_Kirishima",
        "images": [
            "https://storage.googleapis.com/my-hero-academia-api/Eijiro_Kirishima-1.jpg",
            "https://storage.googleapis.com/my-hero-academia-api/Eijiro_Kirishima-2.jpg",
            "https://storage.googleapis.com/my-hero-academia-api/Eijiro_Kirishima-3.jpg",
            "https://storage.googleapis.com/my-hero-academia-api/Eijiro_Kirishima.jpg"
        ]
    }
""".utf8)

private let characterContainingAllFields = Data("""
{
    "id": "Izuku_Midoriya",
    "name": "Izuku Midoriya",
    "alias": "Deku",
    "affiliation": "U.A. High School",
    "birthday": "July 15",
    "bloodtype": "O",
    "description": "Izuku Midoriya (緑 (みどり) 谷 (や) 出 (いず) 久 (く) , Midoriya Izuku?), also known as Deku (デク, Deku?), is the primary protagonist of the My Hero Academia manga and anime series.\\nThough born Quirkless, Izuku manages to catch the attention of the legendary hero All Might due to his innate heroism and strong sense of justice and has since become his close pupil as well as a student in Class 1-A at U.A. High School. All Might passed on his Quirk to Izuku, making him the ninth holder of One For All.\\n",
    "fightstyle": "Shoot Style",
    "gender": "Male",
    "Eye": "Green",
    "hair": "Green",
    "kanji": "緑 (みどり) 谷 (や) 出 (いず) 久 (く) ",
    "occupation": "Student",
    "quirk": "Quirkless, One For All, Blackwhip",
    "romaji": "Midoriya Izuku",
    "status": "Alive",
    "teams": "Team Midoriya (Leader), Shie Hassaikai Raid Team",
    "images": [
        "https://storage.googleapis.com/my-hero-academia-api/Izuku_Midoriya-1.jpg",
        "https://storage.googleapis.com/my-hero-academia-api/Izuku_Midoriya-2.jpg",
        "https://storage.googleapis.com/my-hero-academia-api/Izuku_Midoriya-3.jpg",
        "https://storage.googleapis.com/my-hero-academia-api/Izuku_Midoriya.jpg"
    ],
    "epithet": "New Symbol of Peace",
    "ages": [
        {
            "age": "4 ",
            "when": "First Appearance"
        },
        {
            "age": "14 ",
            "when": "Chapter 1-2"
        },
        {
            "age": "15 ",
            "when": "Chapter 3 to Provisional Hero License Exam Arc"
        },
        {
            "age": "16 ",
            "when": "Current"
        }
    ],
    "family": [
        {
            "id": "Inko_Midoriya",
            "name": "Inko Midoriya"
        },
        {
            "id": "Hisashi_Midoriya",
            "name": "Hisashi Midoriya"
        }
    ]
}
""".utf8)
