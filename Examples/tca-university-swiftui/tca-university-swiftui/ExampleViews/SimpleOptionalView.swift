//
//  SimpleOptionalView.swift
//  TCA-examples
//
//  Created by incetro on 31/10/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import OldTCA
import SwiftUI

// MARK: - SimpleOptionalView

public struct SimpleOptionalView: View {

    // MARK: - Properties

    /// The store powering the `SimpleOptional` feature
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
                        else: Text(viewStore.counterDescription)
                    )
                    Button("Toggle") {
                        viewStore.send(.toggleOptional)
                    }
                }
                .textCase(nil)
            }
            .navigationBarTitle("Simple optional")
        }
    }
}

// MARK: - Constants

extension SimpleOptionalView {

    private enum Constants {

        static let summary = """
        This screen demonstrates work with optional states.

        The parent state holds a `CounterState?` value. When it is not `nil` we will have CounterView.
        But when it is `nil` we will show a single text view fragment with information that current state has a `nil`-counter.

        Tapping "Toggle counter state" will flip between the `nil` and non-`nil` counter states.

        """
    }
}
