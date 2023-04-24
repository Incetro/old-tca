//
//  RecursiveTreeView.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import SwiftUI
import TCA

// MARK: - RecursiveTreeView

struct RecursiveTreeView: View {

    // MARK: - Properties
    
    /// The store powering the `RecursiveTree` feature
    public let store: StoreOf<RecursiveTreeFeature>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store.scope(state: \.name)) { viewStore in
            Form {
                Section(header: Text(template: Constants.summary).standard) {
                    ForEachStore(
                        store.scope(
                            state: \.children,
                            action: RecursiveTreeAction.child(id:action:)
                        )
                    ) { childStore in
                        WithViewStore(childStore) { childViewStore in
                            HStack {
                                Text(childViewStore.name)
                                Spacer()
                                NavigationLink(destination: RecursiveTreeView(store: childStore)) {
                                    Text("")
                                }
                            }
                        }
                    }
                    .onDelete { viewStore.send(.remove($0)) }
                }.textCase(nil)
            }
            .navigationBarTitle(viewStore.state.isEmpty ? "Recursion" : viewStore.state)
            .navigationBarItems(
                trailing: Button("Add") { viewStore.send(.append) }
            )
        }
    }
}

// MARK: - Constants

extension RecursiveTreeView {

    private enum Constants {

        static let summary = """
        This screen demonstrates how the `Reducer` struct can be extended to enhance reducers with extra \
        functionality.

        In it we introduce an interface for constructing reducers that need to be called recursively in \
        order to handle nested state and actions. It is handed itself as its first argument.

        Tap "Add row" to add a row to the current screen's list. Tap on a row to navigate to its own associated list of \
        rows.

        """
    }
}
