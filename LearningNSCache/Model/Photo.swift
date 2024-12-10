//
//  Photo.swift
//  LearningNSCache
//
//  Created by Shailesh Srigiri on 12/9/24.
//


import Foundation

struct Photo: Decodable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
