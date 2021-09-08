//
//  MockCharacterService.swift
//  MHA_CompanionTests
//
//  Created by Wiemer on 9/7/21.
//

@testable import MHA_Companion
import Combine
import Foundation

class MockCharacterService: CharacterServiceProtocol {
    var charactersResponse: [Character]?
    var error: Error?
    var imageData: Data?

    private(set) var fetchCharactersCallCount = 0
    private(set) var fetchImageCallCount = 0
    private(set) var pageArg: Int?
    private(set) var urlArg: String?

    func fetchCharacters(page: Int) -> AnyPublisher<Results, Error> {
        fetchCharactersCallCount += 1
        pageArg = page
        if let error = error {
            return Fail(error: error).eraseToAnyPublisher()
        }

        if let characters = charactersResponse {
            return Result.Publisher(Results.testInstance(characters: characters))
                .eraseToAnyPublisher()
        }

        return Fail(error: TestError.noValue)
            .eraseToAnyPublisher()
    }

    func fetchImage(at url: String) -> AnyPublisher<Data, URLError> {
        fetchImageCallCount += 1
        urlArg = url
        if let error = error as? URLError {
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
        if let data = imageData {
            return Result.Publisher(data)
                .eraseToAnyPublisher()
        }

        return Fail(error: URLError(.cannotParseResponse))
            .eraseToAnyPublisher()
    }

    func reset() {
        charactersResponse = nil
        error = nil
        imageData = nil

        fetchCharactersCallCount = 0
        fetchImageCallCount = 0

        pageArg = nil
        urlArg = nil
    }
}

enum TestError: Error {
    case noValue
}
