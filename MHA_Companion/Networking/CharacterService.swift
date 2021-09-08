//
//  CharactersService.swift
//  MHA_Companion
//
//  Created by Wiemer on 9/1/21.
//

import Combine
import Foundation

protocol CharacterServiceProtocol {
    func fetchCharacters(page: Int) -> AnyPublisher<Results, Error>
    func fetchImage(at url: String) -> AnyPublisher<Data, URLError>
}

struct CharacterService: CharacterServiceProtocol {
    func fetchCharacters(page: Int = 1) -> AnyPublisher<Results, Error> {
        guard let request = RequestFactory.make(endpoint: CharacterEndpoint.page(page)) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }

        return ApiClient().send(request)
            .decode(type: Results.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func fetchImage(at url: String) -> AnyPublisher<Data, URLError> {
        guard let request = RequestFactory.make(endpoint: ImageEndpoint.image(url: url)) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return ApiClient().send(request)
            .eraseToAnyPublisher()
    }
}

struct RequestFactory {
    static func make(endpoint: Endpoint, method: HTTPMethod = "GET") -> URLRequest? {
        guard let url = endpoint.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method
        return request
    }
}

typealias HTTPMethod = String
