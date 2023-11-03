//
//  DeferredTransitionView.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
//

import OldTCA
import SwiftUI

// MARK: - DeferredTransitionView

/// A visual representation of `DeferredTransition` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<DeferredTransitionState, DeferredTransitionAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct DeferredTransitionView: View {

    // MARK: - Properties

    /// The store powering the `DeferredTransition` feature
    public let store: StoreOf<DeferredTransitionFeature>
    
    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text(template: Constants.summary).standard) {
                    NavigationLink(
                        destination: IfLetStore(
                            store.scope(
                                state: \.counter,
                                action: DeferredTransitionAction.counter
                            ),
                            then: CounterView.init
                        ),
                        isActive: viewStore.binding(
                            get: \.isNavigationActive,
                            send: DeferredTransitionAction.setNavigation
                        )
                    ) {
                        HStack {
                            Text("Load optional counter")
                            if viewStore.isLoading {
                                Spacer()
                                ActivityIndicator()
                            }
                        }
                    }
                }.textCase(nil)
            }.navigationTitle("Deferred transition")
        }
    }
}

// MARK: - Constants

extension DeferredTransitionView {

    private enum Constants {

        static let summary = """
        This screen demonstrates deferred transition that depends on loading optional state.

        Tapping "Load optional counter" fires off an effect that will load optional counter a second later \
        and then navigates to a screen that holds the counter module.

        """
    }
}
