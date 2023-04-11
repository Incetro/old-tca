//
//  EffectThrottleView.swift
//  verse-examples
//
//  Created by incetro on 15/10/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA
import SwiftUI

// MARK: - EffectThrottleView

/// A visual representation of `EffectThrottle` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<EffectThrottleState, EffectThrottleAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct EffectThrottleView: View {

    // MARK: - Properties

    /// The store powering the `EffectDebounce` feature
    public let store: StoreOf<EffectThrottleFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text(template: Constants.summary).standard) {
                    CounterView(
                        store: store.scope(
                            state: \.counter,
                            action: EffectThrottleAction.counter
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
            }.navigationBarTitle("Effect throttling")
        }
    }
}

// MARK: - Constants

extension EffectThrottleView {

    enum Constants {

        static let summary = """
        This screen demonstrates how to throttle side effects with a feature built with the VERSE.

        Current example has simple semantics:

        • Tapping "+/-" will trigger an API request to load a fact about the number. Any attempt of tappping on the counter again \
        will not trigger any events in 1 second interval, new effect can be send after 1 second of throttling
        • Tapping "Cancel" will cancel current API request

        All effects are handled by the reducer, and a full test suite is written to confirm \
        that the effects behave in the way we expect.

        """
    }
}
