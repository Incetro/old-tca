//
//  ListInstantTransitionView.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 18.04.2023.
//

import OldTCA
import SwiftUI

// MARK: - ListInstantTransitionView

/// A visual representation of `ListInstantTransition` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<ListInstantTransitionState, ListInstantTransitionAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct ListInstantTransitionView: View {

    // MARK: - Properties

    /// The store powering the `ListInstantTransition` feature
    public let store: StoreOf<ListInstantTransitionFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text(template: Constants.summary).standard) {
                    ForEach(viewStore.items) { row in
                        NavigationLink(
                            destination: IfLetStore(
                                store.scope(
                                    state: { $0.selection?.value },
                                    action: ListInstantTransitionAction.counter
                                ),
                                then: CounterView.init,
                                else: ActivityIndicator()
                            ),
                            tag: row.id,
                            selection: viewStore.binding(
                                get: { $0.selection?.id },
                                send: ListInstantTransitionAction.setNavigation
                            )
                        ) {
                            HStack {
                                Circle()
                                    .foregroundColor(.init(hex: row.color))
                                    .frame(width: 20, height: 20)
                                Text("\(row.title)")
                                    .standard
                                Spacer()
                                Text("\(row.count)")
                                    .standard
                            }
                        }
                    }
                }.textCase(nil)
            }.navigationBarTitle("List instant transition")
        }
    }
}

// MARK: - Constants

extension ListInstantTransitionView {

    private enum Constants {

        static let summary = """
        This screen demonstrates instant transition that depends on loading optional state form a list element.

        Tapping on a row simultaneously navigates to a screen that depends on optional \
        counter state and fires off an effect that will load this state a second later.

        """
    }
}
