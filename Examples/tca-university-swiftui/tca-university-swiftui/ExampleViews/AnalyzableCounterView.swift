//
//  AnalyzableCounterView.swift
//  TCA-examples
//
//  Created by incetro on 02/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA
import SwiftUI

// MARK: - AnalyzableCounterView

public struct AnalyzableCounterView: View {

    // MARK: - Properties

    /// The store powering the `AnalyzableCounter` feature
    public let store: StoreOf<AnalyzableCounterFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text(template: Constants.summary).standard) {
                    HStack {
                        Text("⬆️ Max count")
                        Spacer()
                        Text("\(viewStore.max)")
                    }
                    HStack {
                        Text("⬇️ Min count")
                        Spacer()
                        Text("\(viewStore.min)")
                    }
                    HStack {
                        Text("🔢 Events count")
                        Spacer()
                        Text("\(viewStore.eventsCount)")
                    }
                    HStack {
                        Text("Counter")
                        Spacer()
                        CounterView(
                            store: store.scope(
                                state: \.counter,
                                action: AnalyzableCounterAction.counter
                            )
                        )
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                .textCase(nil)
            }
            .navigationTitle("Analyzable counter")
        }
    }
}

// MARK: - Constants

extension AnalyzableCounterView {

    private enum Constants {

        static let summary = """
        This screen demonstrates how to take small features and compose them into bigger ones using the \
        `combine` operators on reducers and the `Scope` builder on stores.

        It reuses the domain of the counter screen and embeds it in other domain with its own logic:
        tracks maximum / minimum values, events count and general counter value.

        """
    }
}
