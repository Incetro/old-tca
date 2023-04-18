//
//  ListDeferredTransitionView.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 18.04.2023.
//

import TCA
import SwiftUI

// MARK: - ListDeferredTransitionView

/// A visual representation of `ListDeferredTransition` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<ListDeferredTransitionState, ListDeferredTransitionAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct ListDeferredTransitionView: View {

    // MARK: - Properties

    /// The store powering the `ListDeferredTransition` feature
    public let store: StoreOf<ListDeferredTransitionFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text(template: Constants.summary).standard) {
                    ForEach(viewStore.items) { row in
                        NavigationLink(
                            destination: IfLetStore(
                                store.scope(
                                    state: { $0.selection?.value },
                                    action: ListDeferredTransitionAction.counter
                                ),
                                then: CounterView.init,
                                else: ActivityIndicator()
                            ),
                            tag: row.id,
                            selection: viewStore.binding(
                                get: { $0.selection?.id },
                                send: ListDeferredTransitionAction.setNavigation
                            )
                        ) {
                            HStack {
                                Circle()
                                    .foregroundColor(.init(hex: row.color))
                                    .frame(width: 20, height: 20)
                                Text("\(row.title)")
                                    .standard
                                Spacer()
                                if row.isLoading {
                                    ActivityIndicator()
                                }
                                Text("\(row.count)")
                                    .standard
                            }
                        }
                    }
                }.textCase(nil)
            }.navigationBarTitle("List deferred transition")
        }
    }
}

// MARK: - Constants

extension ListDeferredTransitionView {

    private enum Constants {

        static let summary = """
        This screen demonstrates deferred transition that depends on loading optional state form a list element.

        Tapping a row fires off an effect that will load its associated counter state a second later. \
        When the counter state is present, you will be programmatically navigated to the screen that \
        depends on this data.

        """
    }
}
