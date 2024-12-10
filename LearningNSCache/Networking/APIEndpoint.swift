//
//  APIEndpoint.swift
//  LearningNSCache
//
//  Created by Shailesh Srigiri on 12/9/24.
//


import Foundation

enum APIEndpoint {
    case photos
    case image(urlString: String)

    var url: URL? {
        switch self {
        case .photos:
            return URL(string: "https://jsonplaceholder.typicode.com/photos")
        case .image(let urlString):
            return URL(string: urlString)
        }
    }
}
