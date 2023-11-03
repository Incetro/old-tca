//
//  InstantTransitionView.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
//

import OldTCA
import SwiftUI

// MARK: - InstantTransitionView

/// A visual representation of `InstantTransition` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<InstantTransitionState, InstantTransitionAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct InstantTransitionView: View {

    // MARK: - Properties

    /// The store powering the `InstantTransition` feature
    public let store: StoreOf<InstantTransitionFeature>
    
    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text(template: Constants.summary).standard) {
                    NavigationLink(
                        destination: IfLetStore(
                            store.scope(
                                state: \.counter,
                                action: InstantTransitionAction.counter
                            ),
                            then: CounterView.init,
                            else: ActivityIndicator()
                        ),
                        isActive: viewStore.binding(
                            get: \.isNavigationActive,
                            send: InstantTransitionAction.setNavigation
                        )
                    ) {
                        HStack {
                            Text("Load optional counter")
                        }
                    }
                }.textCase(nil)
            }.navigationBarTitle("Instant transition")
        }
    }
}

// MARK: - Constants

extension InstantTransitionView {

    private enum Constants {

        static let summary = """
        This screen demonstrates instant transition that depends on loading optional state.

        Tapping "Load optional counter" simultaneously navigates to a screen that depends on optional \
        counter state and fires off an effect that will load this state a second later.

        """
    }
}
