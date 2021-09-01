//
//  CharactersService.swift
//  MHA_Companion
//
//  Created by Wiemer on 9/1/21.
//

import Combine
import Foundation

struct CharactersService {
    private let mockCharacter = Character(id: "", name: nil, alias: nil, affiliation: nil, birthday: nil, bloodtype: nil, description: nil, fightstyle: nil, gender: nil, Eye: nil, hair: nil, kanji: nil, occupation: nil, quirk: nil, romaji: nil, status: nil, teams: nil, images: [], epithet: nil, ages: nil, family: nil)
    private let apiClient = ApiClient()

    func fetchAllCharacters() -> AnyPublisher<[Character], Error> {
        guard let request = RequestFactory.make(endpoint: .all) else {
            return Fail(error: URLError(URLError.badURL)).eraseToAnyPublisher()
        }

        return apiClient.send(request)
            .decode(type: Results.self, decoder: JSONDecoder())
            .map { $0.results }
            .eraseToAnyPublisher()
    }
}

struct RequestFactory {
    static func make(endpoint: CharacterEndpoint, method: HTTPMethod = "GET") -> URLRequest? {
        guard let url = endpoint.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method
        return request
    }
}

typealias HTTPMethod = String
