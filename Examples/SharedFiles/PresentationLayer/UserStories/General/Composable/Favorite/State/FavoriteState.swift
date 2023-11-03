//
//  FavoriteState.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import OldTCA

// MARK: - FavoriteState

/// `Favorite` module state
///
/// Basically, `FavoriteState` is a type that describes the data
/// `Favorite` feature needs to perform its logic and render its UI.
public struct FavoriteState<ID: Hashable>: Equatable, Identifiable {

    // MARK: - Properties

    /// Alert state value
    public var alert: AlertState<FavoriteAction>?

    /// Unique item id
    public let id: ID

    /// isFavorite flag
    public var isFavorite: Bool

    /// Favorite icon name (selected state)
    public let selectedImageName: String

    /// Favorite icon name (unselected state)
    public let unselectedImageName: String

    /// Current image name
    public var imageName: String {
        isFavorite ? selectedImageName : unselectedImageName
    }
}
