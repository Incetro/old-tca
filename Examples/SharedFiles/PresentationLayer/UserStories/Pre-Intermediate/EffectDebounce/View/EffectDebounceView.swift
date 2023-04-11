//
//  EffectDebounceView.swift
//  verse-examples
//
//  Created by incetro on 15/10/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA
import SwiftUI

// MARK: - EffectDebounceView

/// A visual representation of `EffectDebounce` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<EffectDebounceState, EffectDebounceAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct EffectDebounceView: View {

    // MARK: - Properties

    /// The store powering the `EffectDebounce` feature
    public let store: StoreOf<EffectDebounceFeature>
    
    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text(template: Constants.summary).standard) {
                    CounterView(
                        store: store.scope(
                            state: \.counter,
                            action: EffectDebounceAction.counter
                        )
                    )
                    .buttonStyle(BorderlessButtonStyle())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    if viewStore.isFactRequestInFlight {
                        Button {
                            viewStore.send(.cancelButtonTapped)
                        } label: {
                            HStack {
                                Text("Cancel")
                                    .semibold
                                    .standard
                                Spacer()
                                ActivityIndicator()
                            }
                        }
                    }
                    if viewStore.isFactRequestInFlight {
                        ActivityIndicator()
                    }
                    viewStore.numberFact.map { Text($0) }
                }.textCase(nil)
            }.navigationBarTitle("Effect debouncing")
        }
    }
}

// MARK: - Constants

extension EffectDebounceView {

    enum Constants {

        static let summary = """
        This screen demonstrates how to debounce side effects with a feature built with the VERSE.

        Current example has simple semantics:

        • Tapping "+/-" will trigger an API request to load a fact about the number after 1 second interval.\
        If you tap on the counter again and 1 second hasn't been reached, effect will be reset to initial debouncing state\
        and will wait 1 second again.
        • Tapping "Cancel" will cancel current API request

        All effects are handled by the reducer, and a full test suite is written to confirm \
        that the effects behave in the way we expect.

        """
    }
}
