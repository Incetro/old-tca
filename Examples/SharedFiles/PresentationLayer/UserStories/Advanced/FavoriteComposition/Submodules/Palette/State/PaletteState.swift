//
//  PaletteState.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import TCA
import Foundation

// MARK: - PaletteState

/// `Palette` module state
///
/// Basically, `PaletteState` is a type that describes the data
/// `Palette` feature needs to perform its logic and render its UI.
public struct PaletteState: Equatable, Identifiable {

    // MARK: - Properties

    /// Unique identifier
    public var id: String {
        palette.colors.joined()
    }

    /// Palette instance
    public let palette: Palette

    /// True if we like current palette
    public var isFavorite = false

    /// Alert state
    public var alert: AlertState<FavoriteAction>?

    // MARK: - Favorite

    var favorite: FavoriteState<ID> {
        get {
            .init(
                alert: alert,
                id: id,
                isFavorite: isFavorite,
                selectedImageName: "heart.fill",
                unselectedImageName: "heart"
            )
        }
        set {
            (self.alert, self.isFavorite) = (newValue.alert, newValue.isFavorite)
        }
    }
}
