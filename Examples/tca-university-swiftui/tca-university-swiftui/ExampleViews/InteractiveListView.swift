//
//  InteractiveListView.swift
//  verse-examples
//
//  Created by incetro on 08/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA
import SwiftUI

// MARK: - InteractiveListView

/// A visual representation of `InteractiveList` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<InteractiveListState, InteractiveListAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct InteractiveListView: View {

    // MARK: - Properties

    /// The store powering the `EffectDebounce` feature
    public let store: StoreOf<InteractiveListFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text(template: Constants.summary).standard) {
                    ForEachStore(
                        store.scope(state: \.items, action: InteractiveListAction.item(id:action:)),
                        content: InteractiveListItemView.init(store:)
                    )
                    .onDelete { viewStore.send(.delete($0)) }
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
}

// MARK: - Constants

extension InteractiveListView {

    private enum Constants {

        static let summary = """
        This screen demonstrates interactive work with lists.

        Here we have the same logic as in the previous case. \
        But in this example you have some interactive features:
        
        1. You can tap on a checkbox and item will be removed from the list in one second
        2. You can pull from right to left ("delete" gesture) and instantly remove item from the list.

        You can use `Add` button to add a new random item to the list.

        """
    }
}
