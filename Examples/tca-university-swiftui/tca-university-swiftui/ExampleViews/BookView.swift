//
//  BookView.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import TCA
import SwiftUI

// MARK: - BookView

/// A visual representation of `Book` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<BookState, BookAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct BookView: View {

    // MARK: - Properties

    /// The store powering the `Book` feature
    public let store: StoreOf<BookFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            HStack {
                ZStack {
                    Rectangle()
                        .fill(Color.init(hex: viewStore.book.coverColor))
                        .frame(width: 39, height: 39)
                        .cornerRadius(10)
                    Image(systemName: "book.closed.fill")
                        .foregroundColor(.white)
                }
                VStack(alignment: .leading) {
                    Text(viewStore.book.name)
                        .font(.system(size: 17, weight: .semibold))
                    Text(viewStore.book.author)
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                }
                Spacer()
                VStack(alignment: .center) {
                    FavoriteButton(
                        store: store.scope(
                            state: \.favorite,
                            action: BookAction.favorite
                        )
                    ).foregroundColor(.init(hex: "e71d36"))
                }
            }
        }
    }
}
