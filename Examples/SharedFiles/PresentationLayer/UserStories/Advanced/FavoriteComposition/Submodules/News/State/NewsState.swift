//
//  NewsState.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import TCA
import SwiftUI
import Foundation

// MARK: - NewsState

/// `News` module state
///
/// Basically, `NewsState` is a type that describes the data
/// `News` feature needs to perform its logic and render its UI.
public struct NewsState: Equatable, Identifiable {

    // MARK: - Properties

    /// Unique identifier
    public var id: Int {
        news.id
    }

    /// News entity instance
    public var news: News

    /// User's avatar
    public var avatar: Image?

    /// True if avatar loading is in progress
    public var isAvatarLoading = false

    /// Alert state
    public var alert: AlertState<FavoriteAction>?

    /// FavoriteState instance
    public var favorite: FavoriteState<ID> {
        get {
            .init(
                alert: alert,
                id: id,
                isFavorite: news.isThumbUp,
                selectedImageName: "hand.thumbsup.fill",
                unselectedImageName: "hand.thumbsup"
            )
        }
        set {
            if !news.isThumbUp == newValue.isFavorite {
                news.thumbsCount += newValue.isFavorite ? 1 : -1
            }
            (alert, news.isThumbUp) = (newValue.alert, newValue.isFavorite)
        }
    }
}
