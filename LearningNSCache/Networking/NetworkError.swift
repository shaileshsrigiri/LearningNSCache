//
//  NetworkError.swift
//  LearningNSCache
//
//  Created by Shailesh Srigiri on 12/9/24.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError(Error)
    case invalidImageData
    case noData

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .invalidResponse:
            return "The server response is invalid."
        case .decodingError(let error):
            return "Decoding error: \(error.localizedDescription)"
        case .invalidImageData:
            return "The data is not a valid image."
        case .noData:
            return "No data was returned from the server."
        }
    }
}


