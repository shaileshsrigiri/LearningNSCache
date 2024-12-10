//
//  NetworkManaging.swift
//  LearningNSCache
//
//  Created by Shailesh Srigiri on 12/9/24.
//


import Foundation
import UIKit

protocol NetworkManaging {
    func fetch<T: Decodable>(from endpoint: APIEndpoint) async throws -> T
    func fetchImage(from endpoint: APIEndpoint) async throws -> UIImage
}
