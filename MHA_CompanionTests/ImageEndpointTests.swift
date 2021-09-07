//
//  ImageEndpointTests.swift
//  MHA_CompanionTests
//
//  Created by Wiemer on 9/3/21.
//

@testable import MHA_Companion
import XCTest

class ImageEndpointTests: XCTestCase {

    func testCanBuildURL_filteringByAffiliation() {
        let url = ImageEndpoint.image(url: "https://storage.googleapis.com/my-hero-academia-api/Izuku_Midoriya-2.jpg").url
        XCTAssertNotNil(url)
        XCTAssertEqual(url?.absoluteString, "https://storage.googleapis.com/my-hero-academia-api/Izuku_Midoriya-2.jpg")
    }
}
