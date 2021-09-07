//
//  ImageEndpoint.swift
//  MHA_Companion
//
//  Created by Wiemer on 9/3/21.
//

import Foundation

enum ImageEndpoint: Endpoint {
    case image(url: String)

    var url: URL? {
        switch self {
            case .image(let url): return URL(string: url)
        }
    }
}
