//
//  NewsReducer.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import OldTCA
import Foundation
import SwiftUI

// MARK: - NewsFeature

public struct NewsFeature: ReducerProtocol {
    
    // MARK: - Dependencies
    
    /// NewsService instance
    @Dependency(\.newsService) var newsService
    
    /// ImageService instance
    @Dependency(\.imageService) var imageService
    
    // MARK: - Feature
    
    public var body: some ReducerProtocol<NewsState, NewsAction> {
        Scope(state: \.favorite, action: /NewsAction.favorite) {
            FavoriteFeature { id, isFavorite in
                newsService
                    .refresh(newsID: id, isThumbUp: isFavorite)
                    .eraseToEffect()
            }
        }
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.isAvatarLoading = true
                return imageService
                    .download(imageURL: state.news.publisherAvatarURL)
                    .receive(on: DispatchQueue.main)
                    .mapError { DownloadImageError(error: $0 as NSError) }
                    .catchToEffect(NewsAction.publisherAvatarResponse)
            case let .publisherAvatarResponse(.success(.some(image))):
                state.avatar = Image(uiImage: image)
                return .none
            case .publisherAvatarResponse:
                state.isAvatarLoading = false
                return .none
            default:
                return .none
            }
        }
    }
}
