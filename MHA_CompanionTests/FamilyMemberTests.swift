//
//  FamilyMemberTests.swift
//  MHA_CompanionTests
//
//  Created by Wiemer on 9/1/21.
//

@testable import MHA_Companion
import XCTest

class FamilyMemberTests: XCTestCase {
    func testDecoding_throwsKeyNotFound_whenMissingId() {
        let ageJson = Data("{\"name\": \"Inko Midoriya\"}".utf8)
        XCTAssertThrowsError(try JSONDecoder().decode(FamilyMember.self, from: ageJson)) { error in
            if case .keyNotFound(let key, _)? = error as? DecodingError {
                XCTAssertEqual("id", key.stringValue)
            } else {
                XCTFail("Expected '.keyNotFound' but received \(error)")
            }
        }
    }

    func testDecoding_throwsKeyNotFound_whenMissingName() {
        let ageJson = Data("{\"id\": \"Inko_Midoriya\"}".utf8)
        XCTAssertThrowsError(try JSONDecoder().decode(FamilyMember.self, from: ageJson)) { error in
            if case .keyNotFound(let key, _)? = error as? DecodingError {
                XCTAssertEqual("name", key.stringValue)
            } else {
                XCTFail("Expected '.keyNotFound' but received \(error)")
            }
        }
    }

    func testDecoding_whenAllFieldsPresent() {
        let ageJson = Data("{\"id\": \"Inko_Midoriya\",\"name\": \"Inko Midoriya\"}".utf8)

        let result = try? JSONDecoder().decode(FamilyMember.self, from: ageJson)

        XCTAssertNotNil(result)
        XCTAssertEqual(result?.id, "Inko_Midoriya")
        XCTAssertEqual(result?.name, "Inko Midoriya")
    }
}
