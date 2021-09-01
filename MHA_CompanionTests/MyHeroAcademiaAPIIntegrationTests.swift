//
//  MyHeroAcademiaAPIIntegrationTests.swift
//  MHA_CompanionTests
//
//  Created by Wiemer on 9/1/21.
//

@testable import MHA_Companion

import Combine
import XCTest

class MyHeroAcademiaAPIIntegrationTests: XCTestCase {
    private var disposeBag = Set<AnyCancellable>()
    var service: CharactersService!

    override func setUp() {
        service = CharactersService()
    }

    func testCanRetrieveAListFromAll() {
        let expect = expectation(description: "Waiting for API Response")
        service.fetchAllCharacters()
            .sink(receiveCompletion: {_ in }) { characters in
                XCTAssertEqual(characters.count, 20)
                expect.fulfill()
            }
            .store(in: &disposeBag)
        
        wait(for: [expect], timeout: 5)
    }
}
