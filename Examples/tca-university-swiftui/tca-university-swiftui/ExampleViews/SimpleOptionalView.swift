//
//  SimpleOptionalView.swift
//  verse-examples
//
//  Created by incetro on 31/10/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA
import SwiftUI

// MARK: - SimpleOptionalView

/// A visual representation of `SimpleOptional` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<SimpleOptionalState, SimpleOptionalAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct SimpleOptionalView: View {

    // MARK: - Properties

    /// `SimpleOptional` module `Store` instance
    public let store: StoreOf<SimpleOptionalFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text(template: Constants.summary).standard) {
                    IfLetStore(
                        store.scope(
                            state: \.counter,
                            action: SimpleOptionalAction.counter
                        ),
                        then: { store in
                            HStack {
                                Text(viewStore.counterDescription)
                                Spacer()
                                CounterView(store: store)
                                    .buttonStyle(BorderlessButtonStyle())
                            }
                        },
                        else: {
                            Text(viewStore.counterDescription)
                        }
                    )
                    Button("Toggle") {
                        viewStore.send(.toggleOptional)
                    }
                }.textCase(nil)
            }.navigationBarTitle("Simple optional")
        }
    }
}

// MARK: - Constants

extension SimpleOptionalView {

    enum Constants {

        static let summary = """
        This screen demonstrates work with optional states.

        The parent state holds a `CounterState?` value. When it is not `nil` we will have CounterView.
        But when it is `nil` we will show a single text view fragment with information that current state has a `nil`-counter.

        Tapping "Toggle counter state" will flip between the `nil` and non-`nil` counter states.

        """
    }
}
