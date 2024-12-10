//
//  NetworkManager.swift
//  LearningNSCache
//
//  Created by Shailesh Srigiri on 12/9/24.
//


import Foundation
import UIKit

final class NetworkManager: NetworkManaging {
    static let shared = NetworkManager()
    private let session: URLSession
    private let imageCache = NSCache<NSString, UIImage>()

    private init() {
        self.session = URLSession(configuration: .default)
    }

    func fetch<T: Decodable>(from endpoint: APIEndpoint) async throws -> T {
        guard let url = endpoint.url else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError(error)
        }
    }

    func fetchImage(from endpoint: APIEndpoint) async throws -> UIImage {
        guard case let .image(urlString) = endpoint else {
            throw NetworkError.invalidURL
        }

        let cacheKey = NSString(string: urlString)

        if let cachedImage = imageCache.object(forKey: cacheKey) {
            return cachedImage
        }

        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }

        guard let image = UIImage(data: data) else {
            throw NetworkError.invalidImageData
        }

        imageCache.setObject(image, forKey: cacheKey)
        return image
    }
}
