//
//  ImageLoaderTests.swift
//  MHA_CompanionTests
//
//  Created by Wiemer on 9/7/21.
//

@testable import MHA_Companion
import Combine
import XCTest

class ImageLoaderTests: XCTestCase {
    private var disposeBag = Set<AnyCancellable>()

    func testIsLoadingFlipsToTrue() {
        let expect = expectation(description: "Waiting for loading value to change")

        let urlString = UUID().uuidString
        let mockService = MockCharacterService()
        let imageLoader = ImageLoader(characterService: mockService)

        XCTAssertFalse(imageLoader.isLoading)

        imageLoader.loadImage(from: urlString)

        imageLoader.$isLoading
            .sink { isLoading in
                XCTAssertTrue(isLoading)
                expect.fulfill()
            }
            .store(in: &disposeBag)

        wait(for: [expect], timeout: 1)
    }

    func testWhenUrlIsNil() {
        let mockService = MockCharacterService()
        let imageLoader = ImageLoader(characterService: mockService)

        imageLoader.loadImage(from: nil)

        XCTAssertFalse(imageLoader.isLoading)
        XCTAssertNil(imageLoader.data)
        XCTAssertEqual(mockService.fetchImageCallCount, 0)
        XCTAssertNil(mockService.urlArg)
    }

    func testIsLoadingIsFalse_whenErrorReceived() {
        let expect = expectation(description: "Waiting for loading value to change twice")

        let urlString = UUID().uuidString
        let mockService = MockCharacterService()
        mockService.error = URLError(.badServerResponse)
        let imageLoader = ImageLoader(characterService: mockService)

        XCTAssertFalse(imageLoader.isLoading)

        imageLoader.loadImage(from: urlString)

        XCTAssertNil(imageLoader.data)
        XCTAssertEqual(mockService.fetchImageCallCount, 1)
        XCTAssertEqual(mockService.urlArg, urlString)

        imageLoader.$isLoading
            .dropFirst(1)
            .sink { isLoading in
                XCTAssertFalse(isLoading)
                expect.fulfill()
            }
            .store(in: &disposeBag)

        wait(for: [expect], timeout: 1)
    }

    func testWhenImageDataReceived() {
        let expect = expectation(description: "Waiting for loading value to change twice")
        var expectFullfilled = false

        let urlString = UUID().uuidString
        let expectedData = Data()
        let mockService = MockCharacterService()
        mockService.imageData = expectedData
        let imageLoader = ImageLoader(characterService: mockService)

        XCTAssertFalse(imageLoader.isLoading)

        imageLoader.loadImage(from: urlString)

        XCTAssertEqual(mockService.fetchImageCallCount, 1)
        XCTAssertEqual(mockService.urlArg, urlString)

        imageLoader.$isLoading
            .dropFirst(1)
            .sink { isLoading in
                XCTAssertFalse(isLoading)
            }
            .store(in: &disposeBag)

        imageLoader.$data
            .dropFirst(1)
            .sink { data in
                XCTAssertNotNil(data)
                XCTAssertEqual(data, expectedData)
                if !expectFullfilled {
                    expectFullfilled = true
                    expect.fulfill()
                }
            }
            .store(in: &disposeBag)

        wait(for: [expect], timeout: 1)
    }
}
