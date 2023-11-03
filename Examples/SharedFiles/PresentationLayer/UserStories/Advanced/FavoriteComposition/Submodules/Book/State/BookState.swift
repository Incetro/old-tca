//
//  BookState.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import OldTCA
import Foundation

// MARK: - BookState

/// `Book` module state
///
/// Basically, `BookState` is a type that describes the data
/// `Book` feature needs to perform its logic and render its UI.
public struct BookState: Equatable, Identifiable {

    // MARK: - Properties

    /// Unique identifier
    public var id: String {
        book.name + book.author
    }

    /// Book entity instance
    public var book: Book

    /// Alert state
    public var alert: AlertState<FavoriteAction>?

    /// FavoriteState instance
    public var favorite: FavoriteState<ID> {
        get {
            .init(
                alert: alert,
                id: id,
                isFavorite: book.isBookmark,
                selectedImageName: "bookmark.fill",
                unselectedImageName: "bookmark"
            )
        }
        set {
            (alert, book.isBookmark) = (newValue.alert, newValue.isFavorite)
        }
    }
}
