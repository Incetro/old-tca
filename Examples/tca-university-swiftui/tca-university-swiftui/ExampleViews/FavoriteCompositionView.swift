//
//  FavoriteCompositionView.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import OldTCA
import SwiftUI

// MARK: - FavoriteCompositionView

/// A visual representation of `FavoriteComposition` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<FavoriteCompositionState, FavoriteCompositionAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct FavoriteCompositionView: View {

    // MARK: - Properties

    /// The store powering the `FavoriteComposition` feature
    public let store: StoreOf<FavoriteCompositionFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {

                Section(header: Text(template: Constants.summary).standard) {
                }.textCase(nil)

                /// Palettes section
                Section(
                    header: Text("Palettes")
                        .semiboldSection
                ) {
                    ForEachStore(
                        store.scope(
                            state: \.palettes,
                            action: FavoriteCompositionAction.palette(id:action:)
                        )
                    ) { rowStore in
                        PaletteView(store: rowStore)
                            .buttonStyle(BorderlessButtonStyle())
                    }
                }.textCase(nil)

                /// Users section
                Section(
                    header: Text("Users")
                        .semiboldSection
                ) {
                    ForEachStore(
                        store.scope(
                            state: \.users,
                            action: FavoriteCompositionAction.user(id:action:)
                        )
                    ) { rowStore in
                        UserView(store: rowStore)
                            .buttonStyle(BorderlessButtonStyle())
                            .frame(height: 50)
                    }
                }.textCase(nil)

                /// Books section
                Section(
                    header: Text("Books")
                        .semiboldSection
                ) {
                    ForEachStore(
                        store.scope(
                            state: \.books,
                            action: FavoriteCompositionAction.book(id:action:)
                        )
                    ) { rowStore in
                        BookView(store: rowStore)
                            .buttonStyle(BorderlessButtonStyle())
                            .frame(height: 50)
                    }
                }.textCase(nil)

                /// News section
                Section(
                    header: Text("News")
                        .semiboldSection
                ) {
                    ForEachStore(
                        store.scope(
                            state: \.news,
                            action: FavoriteCompositionAction.news(id:action:)
                        )
                    ) { rowStore in
                        NewsView(store: rowStore)
                            .buttonStyle(BorderlessButtonStyle())
                    }
                }.textCase(nil)

            }.navigationBarTitle("Favoriting")
        }
    }
}

// MARK: - Constants

extension FavoriteCompositionView {

    private enum Constants {

        static let summary = """
        This screen demonstrates how one can create reusable components in the VERSE.

        It introduces the domain, logic, and view around "favoriting" something, which is considerably \
        complex.

        A feature can give itself the ability to "favorite" part of its state by embedding the domain of \
        favoriting, using the `favorite` higher-order reducer, and passing an appropriately scoped store \
        to `FavoriteButton`.

        Tapping the favorite button on a row will instantly reflect in the UI and fire off an effect to \
        do any necessary work, like writing to a database or making an API request. For each example we have simulated a \
        requests that takes 1-3 seconds (depends on example) to run and may fail 25% of the time. Failures result in rolling back \
        favorite state and rendering an alert.

        You can explore this complex "favoriting" logic with such examples as:
        1. Palettes. You can like any pallette that is pleasant for you.
        2. Users. You can favorite any of the given users
        3. Books. You can save any book to your bookmarks
        4. Posts. Thumbs up any post you like

        Yep, all of these submodules works completely perfect with the same logic using "favorite" composition.

        """
    }
}
