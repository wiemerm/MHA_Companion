//
//  MyHeroAcademiaAPIIntegrationTests.swift
//  MHA_CompanionTests
//
//  Created by Wiemer on 9/1/21.
//

@testable import MHA_Companion
import Combine
import SwiftUI
import XCTest

class MyHeroAcademiaAPIIntegrationTests: XCTestCase {
    private var disposeBag = Set<AnyCancellable>()
    var service: CharacterService!

    override func setUp() {
        service = CharacterService()
    }

    func testFetchCharactersFetchesFirstPageByDefault() {
        let expect = expectation(description: "Waiting for API Response")
        service.fetchCharacters()
            .sink(receiveCompletion: { _ in }) { results in
                let characters = results.characters
                XCTAssertEqual(results.currentPage, 1)
                XCTAssertEqual(results.pages, 16)
                XCTAssertEqual(characters.count, 20)
                XCTAssertEqual(characters.first?.id, "Abegawa_Tenchu_Kai")
                expect.fulfill()
            }
            .store(in: &disposeBag)

        wait(for: [expect], timeout: TestHelpers.timeout)
    }

    func testFetchCharacters_withSpecificPage() {
        let expect = expectation(description: "Waiting for API Response")
        service.fetchCharacters(page: 5)
            .sink(receiveCompletion: { _ in }) { results in
                let characters = results.characters
                XCTAssertEqual(characters.count, 20)
                XCTAssertEqual(characters.first?.id, "Hizashi_Yamada")
                expect.fulfill()
            }
            .store(in: &disposeBag)

        wait(for: [expect], timeout: TestHelpers.timeout)
    }

    func testFetchImage() {
        let expect = expectation(description: "Waiting for API Response")
        service.fetchImage(at: "https://storage.googleapis.com/my-hero-academia-api/Izuku_Midoriya-2.jpg")
            .sink(receiveCompletion: { _ in }) { data in
                let image = UIImage(data: data)
                XCTAssertNotNil(image)
                expect.fulfill()
            }
            .store(in: &disposeBag)

        wait(for: [expect], timeout: TestHelpers.timeout)
    }
}
