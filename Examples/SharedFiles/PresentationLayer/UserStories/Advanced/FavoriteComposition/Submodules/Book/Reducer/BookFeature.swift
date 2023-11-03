//
//  BookReducer.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import OldTCA

// MARK: - BookFeature

public struct BookFeature: ReducerProtocol {
    
    // MARK: - Dependencies
    
    /// BookService instance
    @Dependency(\.bookService) var bookService
    
    // MARK: - Feature
    
    public var body: some ReducerProtocol<BookState, BookAction> {
        Scope(state: \.favorite, action: /BookAction.favorite) {
            FavoriteFeature { id, isFavorite in
                bookService
                    .refresh(bookID: id, isBookmark: isFavorite)
                    .eraseToEffect()
            }
        }
        EmptyReducer()
    }
}
