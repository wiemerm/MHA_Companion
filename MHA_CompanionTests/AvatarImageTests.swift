//
//  AvatarImageTests.swift
//  MHA_CompanionTests
//
//  Created by Wiemer on 9/7/21.
//

@testable import MHA_Companion
import SwiftUI
import XCTest
import ViewInspector

class AvatarImageTests: XCTestCase {
    func testInitialState() {
        let character = Character.testInstance(id: "Izuku_Midoriya", images: ["https://storage.googleapis.com/my-hero-academia-api/Izuku_Midoriya.jpg"])
        let mockImageLoader = MockImageLoader()
        let sut = AvatarImage(character: character, imageLoader: mockImageLoader)
        let expectedImage = Image(systemName: Strings.placeholderAvatar).accessibility(identifier: "placeholder avatar")

        XCTAssertNoThrow(try sut.inspect().find(ViewType.Image.self))
        XCTAssertNotNil(try? sut.inspect().find(ViewType.Image.self).accessibilityIdentifier())
        XCTAssertEqual(try? sut.inspect().find(ViewType.Image.self).accessibilityIdentifier(),
                       try? expectedImage.inspect().accessibilityIdentifier())
    }

    func testLoadingState() {
        let character = Character.testInstance(id: "Izuku_Midoriya", images: ["https://storage.googleapis.com/my-hero-academia-api/Izuku_Midoriya.jpg"])
        let mockImageLoader = MockImageLoader()
        mockImageLoader.isLoading = true
        let sut = AvatarImage(character: character, imageLoader: mockImageLoader)

        XCTAssertNoThrow(try sut.inspect().find(ViewType.ProgressView.self))
    }
}

class MockImageLoader: ImageLoader {
    private(set) var loadImageCallCount = 0
    private(set) var urlArg: String?

    override func loadImage(from url: String?) {
        loadImageCallCount += 1
        urlArg = url
    }
}
