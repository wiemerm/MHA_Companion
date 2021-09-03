//
//  CharacterEndpoints.swift
//  MHA_Companion
//
//  Created by Wiemer on 9/1/21.
//

import Foundation

enum CharacterEndpoint {
    case all
    case page(_ page: Int)
    case character(id: String)
    case filter(_ filter: Filter, value: String)

    private var scheme: String {
        "https"
    }

    private var baseUrl: String {
        "myheroacademiaapi.com"
    }

    private var path: String {
        switch self {
            case .all, .page, .filter: return "/api/character"
            case .character(let id) : return "/api/character/\(id)"
        }
    }

    private var queryItems: [URLQueryItem]? {
        switch self {
            case .all, .character: return nil
            case .page(let page): return [URLQueryItem(name: "page", value: "\(page)")]
            case .filter(let filter, let value): return [URLQueryItem(name: filter.rawValue, value: value)]
        }
    }

    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = baseUrl
        components.path = path
        components.queryItems = queryItems

        return components.url
    }
}

enum Filter: String {
    case name
    case alias
    case quirk
    case occupation
    case affiliation
}
