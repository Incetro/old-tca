//
//  SheetDeferredTransitionView.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
//

import TCA
import SwiftUI

// MARK: - SheetDeferredTransitionView

/// A visual representation of `SheetDeferredTransition` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<SheetDeferredTransitionState, SheetDeferredTransitionAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct SheetDeferredTransitionView: View {

    // MARK: - Properties

    /// The store powering the `EffectDebounce` feature
    public let store: StoreOf<SheetDeferredTransitionFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text(template: Constants.summary).standard) {
                    Button {
                        viewStore.send(.setSheet(isPresented: true))
                    } label: {
                        HStack {
                            Text("Load optional counter")
                            if viewStore.isLoading {
                                Spacer()
                                ActivityIndicator()
                            }
                        }
                    }

                }
                .textCase(nil)
                .sheet(
                    isPresented: viewStore.binding(
                        get: \.isSheetPresented,
                        send: SheetDeferredTransitionAction.setSheet
                    )
                ) {
                    IfLetStore(
                        store.scope(
                            state: \.counter,
                            action: SheetDeferredTransitionAction.counter
                        ),
                        then: CounterView.init
                    )
                }
            }.navigationBarTitle("Sheet deferred transition")
        }
    }
}

// MARK: - Constants

extension SheetDeferredTransitionView {

    private enum Constants {

        static let summary = """
        This screen demonstrates deferred transition that depends on loading optional data into state.

        Tapping "Load optional counter" fires off an effect that will load counter state a second later \
        and presents a sheet that depends on the counter.

        """
    }
}
