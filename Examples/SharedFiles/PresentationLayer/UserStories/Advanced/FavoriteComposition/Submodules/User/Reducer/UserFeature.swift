//
//  UserReducer.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import TCA
import Foundation
import SwiftUI

// MARK: - UserFeature

public struct UserFeature: ReducerProtocol {
    
    // MARK: - Dependencies
    
    /// UserService instance
    @Dependency(\.userService) var userService
    
    /// ImageService instance
    @Dependency(\.imageService) var imageService
    
    // MARK: - Feature
    
    public var body: some ReducerProtocol<UserState, UserAction> {
        Scope(state: \.favorite, action: /UserAction.favorite) {
            FavoriteFeature { id, isFavorite in
                userService
                    .refresh(userID: id, isStarred: isFavorite)
                    .eraseToEffect()
            }
        }
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.isAvatarLoading = true
                return imageService
                    .download(imageURL: state.user.avatarURL)
                    .receive(on: DispatchQueue.main)
                    .mapError { DownloadImageError(error: $0 as NSError) }
                    .catchToEffect(UserAction.avatarResponse)
            case let .avatarResponse(.success(.some(image))):
                state.avatar = Image(uiImage: image)
                return .none
            case .avatarResponse:
                state.isAvatarLoading = false
                return .none
            default:
                return .none
            }
        }
    }
}
