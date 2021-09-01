//
//  ApiClient.swift
//  MHA_Companion
//
//  Created by Wiemer on 9/1/21.
//

import Combine
import Foundation

struct ApiClient {
    func send(_ request: URLRequest) -> AnyPublisher<Data, URLError> {
        URLSession.shared
            .dataTaskPublisher(for: request)
            .map { $0.data }
            .eraseToAnyPublisher()
    }
}

enum ApiError: Error {
    case encodingFailure, invalidURL
}
