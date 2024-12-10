//
//  PhotosViewModel.swift
//  LearningNSCache
//
//  Created by Shailesh Srigiri on 12/9/24.
//


import Foundation
import UIKit

class PhotosViewModel {
    var photos: [Photo] = []
    var reloadData: (() -> Void)?
    var onError: ((String) -> Void)?
    let networkManager: NetworkManaging?
    
    init(networkManager: NetworkManaging = NetworkManager.shared) {
            self.networkManager = networkManager
        }

    func fetchPhotos() {
        Task {
            do {
                self.photos = try await networkManager?.fetch(from: .photos) ?? []
                DispatchQueue.main.async {
                    self.reloadData?()
                }
            } catch {
                DispatchQueue.main.async {
                    self.onError?(error.localizedDescription)
                }
            }
        }
    }

    func photo(at index: Int) -> Photo {
        return photos[index]
    }

    var numberOfPhotos: Int {
        return photos.count
    }
}
