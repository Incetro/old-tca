//
//  DoubleCounterView.swift
//  verse-examples
//
//  Created by incetro on 13/10/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA
import SwiftUI

// MARK: - DoubleCounterView

public struct DoubleCounterView: View {

    // MARK: - Properties

    /// The store powering the `DoubleCounter` feature
    public let store: StoreOf<DoubleCounterFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text(template: Constants.summary).standard) {
                    HStack {
                        Text("#1").standard
                        Spacer()
                        CounterView(
                            store: store.scope(
                                state: \.counter1,
                                action: DoubleCounterAction.counter1
                            )
                        )
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    HStack {
                        Text("#2").standard
                        Spacer()
                        CounterView(
                            store: store.scope(
                                state: \.counter2,
                                action: DoubleCounterAction.counter2
                            )
                        )
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }.textCase(nil)
            }
            .padding([.trailing], 8)
            .navigationBarTitle("Composition")
        }
    }
}

// MARK: - Constants

extension DoubleCounterView {

    enum Constants {

        static let summary = """
        This screen demonstrates how to take small features and compose them into bigger ones using the \
        `pullback` and `combine` operators on reducers, and the `scope` operator on stores.

        It reuses the domain of the counter screen and embeds it, twice, in a larger domain.
        
        """
    }
}
