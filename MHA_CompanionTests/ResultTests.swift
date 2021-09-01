//
//  ResultTests.swift
//  MHA_CompanionTests
//
//  Created by Wiemer on 9/1/21.
//

@testable import MHA_Companion
import XCTest

class ResultTests: XCTestCase {
    func testCanParseResults() {
        let result = try? JSONDecoder().decode(Results.self, from: resultsJson)
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.currentPage, 1)
        XCTAssertEqual(result?.count, 57)
        XCTAssertEqual(result?.pages, 3)
        XCTAssertEqual(result?.results.count, 1)
        XCTAssertEqual(result?.results[0].name, "Bibimi Kenranzaki")
    }
}

let resultsJson = Data("""
    {
        "info": {
            "currentPage": 1,
            "count": 57,
            "pages": 3
        },
        "result": [
            {
                "id": "Bibimi_Kenranzaki",
                "name": "Bibimi Kenranzaki",
                "affiliation": "U.A. High School",
                "occupation": "Student",
                "status": "Alive",
                "images": [
                    "https://storage.googleapis.com/my-hero-academia-api/Bibimi_Kenranzaki-1.jpg",
                    "https://storage.googleapis.com/my-hero-academia-api/Bibimi_Kenranzaki-2.jpg",
                    "https://storage.googleapis.com/my-hero-academia-api/Bibimi_Kenranzaki.jpg"
                ]
            }
        ]
    }
""".utf8)
