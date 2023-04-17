//
//  FibonacciCounterView.swift
//  TCA-examples
//
//  Created by incetro on 02/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA
import SwiftUI

// MARK: - FibonacciCounterView

public struct FibonacciCounterView: View {

    // MARK: - Properties

    /// The store powering the `FibonacciCounter` feature
    public let store: StoreOf<FibonacciCounterFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text(template: Constants.summary).standard) {
                    HStack {
                        Text("Counter")
                        Spacer()
                        CounterView(
                            store: store.scope(
                                state: \.counter,
                                action: FibonacciCounterAction.counter
                            )
                        )
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    HStack {
                        Text("Fibonacci status:")
                            .semibold
                            .standard
                        Spacer()
                        Text(viewStore.fibonacchiText).standard
                    }
                }
                .textCase(nil)
            }
            .navigationTitle("Fibonacci counter")
        }
    }
}

// MARK: - Constants

extension FibonacciCounterView {

    private enum Constants {

        static let summary = """
        This screen demonstrates how to take small features and compose them into bigger ones using the `scope` operator on stores and reducers.

        It reuses the domain of the counter screen and embeds it in other domain with its own logic:
        checks if current number is a Fibonacci number.

        """
    }
}
