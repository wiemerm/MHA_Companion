//
//  AgeTests.swift
//  MHA_CompanionTests
//
//  Created by Wiemer on 9/1/21.
//

@testable import MHA_Companion
import XCTest

class AgeTests: XCTestCase {
    func testDecoding_throwsKeyNotFound_whenMissingAge() {
        let ageJson = Data("{\"when\": \"First Appearance\"}".utf8)
        XCTAssertThrowsError(try JSONDecoder().decode(Age.self, from: ageJson)) { error in
            if case .keyNotFound(let key, _)? = error as? DecodingError {
                XCTAssertEqual("age", key.stringValue)
            } else {
                XCTFail("Expected '.keyNotFound' but received \(error)")
            }
        }
    }

    func testDecoding_throwsKeyNotFound_whenMissingWhen() {
        let ageJson = Data("{\"age\": \"First Appearance\"}".utf8)
        XCTAssertThrowsError(try JSONDecoder().decode(Age.self, from: ageJson)) { error in
            if case .keyNotFound(let key, _)? = error as? DecodingError {
                XCTAssertEqual("when", key.stringValue)
            } else {
                XCTFail("Expected '.keyNotFound' but received \(error)")
            }
        }
    }

    func testDecoding_whenAllFieldsPresent() {
        let ageJson = Data("{\"age\": \"14 \",\"when\": \"Chapter 1-2\"}".utf8)

        let result = try? JSONDecoder().decode(Age.self, from: ageJson)

        XCTAssertNotNil(result)
        XCTAssertEqual(result?.years, 14)
        XCTAssertEqual(result?.when, "Chapter 1-2")
    }

}
