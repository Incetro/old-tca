//
//  AlertAndSheetView.swift
//  verse-examples
//
//  Created by incetro on 31/10/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA
import SwiftUI

// MARK: - AlertAndSheetView

/// A visual representation of `AlertAndSheet` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<AlertAndSheetState, AlertAndSheetAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct AlertAndSheetView: View {

    // MARK: - Properties

    /// `AlertAndSheet` module `Store` instance
    public let store: StoreOf<AlertAndSheetFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text(template: Constants.summary).standard) {
                    Text("Count: \(viewStore.count)").standard
                    Button("Alert") {
                        viewStore.send(.alertButtonTapped)
                    }
                    .alert(
                        store.scope(state: \.alert),
                        dismiss: .alertDismissed
                    )
                    Button("Sheet") {
                        viewStore.send(.actionSheetButtonTapped)
                        
                    }
                    .confirmationDialog(
                        store.scope(state: \.actionSheet),
                        dismiss: .actionSheetDismissed
                    )
                }.textCase(nil)
            }.navigationTitle("Alert and ActionSheet")
        }
    }
}

// MARK: - Constants

extension AlertAndSheetView {

    enum Constants {

        static let summary = """
        This demonstrates how to work with alerts and action sheets in the VERSE.

        Because the library demands that all data flow through the application in a single direction, we \
        cannot use SwiftUI's two-way bindings because they can make changes to state without going through a reducer. \
        This means we can't directly use the standard API to display alerts and sheets.

        The library comes with two types, `AlertState` and `ActionSheetState`, which can be constructed from reducers \
        and control whether or not an alert or action sheet is displayed. Further, it automatically handles sending actions \
        when you tap their buttons, which allows you to properly handle their functionality in the reducer \
        rather than in two-way bindings and action closures.

        The benefit of doing this is that you can get full test coverage on how a user interacts with alerts and action sheets in your application

        """
    }
}
