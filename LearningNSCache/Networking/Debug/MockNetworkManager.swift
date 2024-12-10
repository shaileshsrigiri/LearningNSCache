//
//  MockNetworkManager.swift
//  LearningNSCache
//
//  Created by Shailesh Srigiri on 12/10/24.
//

import Foundation
import UIKit

class MockNetworkManager: NetworkManaging {
    static let shared = MockNetworkManager()
    func fetch<T>(from endpoint: APIEndpoint) async throws -> T where T: Decodable {
        switch endpoint {
        case .photos:
            guard let jsonMockData = jsonMockData else {
                throw NetworkError.noData
            }
            do {
                let mockPhotos = try JSONDecoder().decode([Photo].self, from: jsonMockData)
                return mockPhotos as! T
            } catch {
                throw NetworkError.decodingError(error)
            }

        case .image:
            throw NetworkError.invalidResponse
        }
    }

    func fetchImage(from endpoint: APIEndpoint) async throws -> UIImage {
        switch endpoint {
        case .image(let urlString):
            print("Mock fetching image from: \(urlString)")
            return UIImage(systemName: "photo")!
        default:
            throw NetworkError.invalidURL
        }
    }
}




var jsonMockData = """
[
  {
    "albumId": 1,
    "id": 1,
    "title": "Title 1",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952"
  },
  {
    "albumId": 1,
    "id": 2,
    "title": "Title 2",
    "url": "https://via.placeholder.com/600/771796",
    "thumbnailUrl": "https://via.placeholder.com/150/771796"
  },
  {
    "albumId": 1,
    "id": 3,
    "title": "Title 3",
    "url": "https://via.placeholder.com/600/24f355",
    "thumbnailUrl": "https://via.placeholder.com/150/24f355"
  },
  {
    "albumId": 1,
    "id": 4,
    "title": "Title 4",
    "url": "https://via.placeholder.com/600/d32776",
    "thumbnailUrl": "https://via.placeholder.com/150/d32776"
  },
  {
    "albumId": 1,
    "id": 5,
    "title": "Title 5",
    "url": "https://via.placeholder.com/600/f66b97",
    "thumbnailUrl": "https://via.placeholder.com/150/f66b97"
  },
  {
    "albumId": 1,
    "id": 6,
    "title": "Title 6",
    "url": "https://via.placeholder.com/600/56a8c2",
    "thumbnailUrl": "https://via.placeholder.com/150/56a8c2"
  },
  {
    "albumId": 1,
    "id": 7,
    "title": "Title 7",
    "url": "https://via.placeholder.com/600/b0f7cc",
    "thumbnailUrl": "https://via.placeholder.com/150/b0f7cc"
  },
  {
    "albumId": 1,
    "id": 8,
    "title": "Title 8",
    "url": "https://via.placeholder.com/600/54176f",
    "thumbnailUrl": "https://via.placeholder.com/150/54176f"
  },
  {
    "albumId": 1,
    "id": 9,
    "title": "Title 9",
    "url": "https://via.placeholder.com/600/51aa97",
    "thumbnailUrl": "https://via.placeholder.com/150/51aa97"
  },
  {
    "albumId": 1,
    "id": 10,
    "title": "Title 10",
    "url": "https://via.placeholder.com/600/810b14",
    "thumbnailUrl": "https://via.placeholder.com/150/810b14"
  }
]
""".data(using: .utf8)
