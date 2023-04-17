//
//  BasicListView.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
//

import TCA
import SwiftUI

// MARK: - BasicListView

/// A visual representation of `BasicList` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<BasicListState, BasicListAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct BasicListView: View {

    // MARK: - Properties

    /// The store powering the `EffectDebounce` feature
    public let store: StoreOf<BasicListFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text(template: Constants.summary).standard) {
                    ForEach(viewStore.items) { item in
                        ItemView(item: item)
                    }
                }.textCase(nil)
            }
            .navigationBarItems(trailing: HStack {
                Button(action: { viewStore.send(.addRandom, animation: .default) }) {
                    Text("Add")
                }
            })
            .navigationTitle("Basic list")
            .onAppear {
                viewStore.send(.updateItems)
            }
        }
    }

    // MARK: - ItemView

    private struct ItemView: View {

        // MARK: - Properties

        let item: BasicListState.Item

        // MARK: - View

        var body: some View {
            HStack {
                Circle()
                    .fill(Color(hex: item.color))
                    .frame(width: 20, height: 20)
                Text(item.title)
                    .standard
                Spacer()
                Image(systemName: item.image)
                    .renderingMode(.original)
            }
            .frame(height: 40)
        }
    }
}

// MARK: - Constants

extension BasicListView {

    private enum Constants {

        static let summary = """
        This screen demonstrates work with lists.

        Here we have a simple list with color, title and image views.
        You can use `Add` button to add a new random item to the list.

        """
    }
}
