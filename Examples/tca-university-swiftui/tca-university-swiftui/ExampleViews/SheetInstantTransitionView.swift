//
//  SheetInstantTransitionView.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
//

import TCA
import SwiftUI

// MARK: - SheetInstantTransitionView

/// A visual representation of `SheetInstantTransition` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<SheetInstantTransitionState, SheetInstantTransitionAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct SheetInstantTransitionView: View {

    // MARK: - Properties

    /// The store powering the `EffectDebounce` feature
    public let store: StoreOf<SheetInstantTransitionFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text(template: Constants.summary).standard) {
                    Button("Load optional counter") {
                        viewStore.send(.setSheet(isPresented: true))
                    }
                }
                .textCase(nil)
                .sheet(
                    isPresented: viewStore.binding(
                        get: \.isSheetPresented,
                        send: SheetInstantTransitionAction.setSheet
                    )
                ) {
                    IfLetStore(
                        store.scope(
                            state: \.counter,
                            action: SheetInstantTransitionAction.counter
                        ),
                        then: CounterView.init,
                        else: ActivityIndicator()
                    )
                }
            }
            .navigationBarTitle("Sheet instant transition")
        }
    }
}

// MARK: - Constants

extension SheetInstantTransitionView {

    private enum Constants {

        static let summary = """
        This screen demonstrates instant transition that depends on loading optional data into state.

        Tapping "Load optional counter" simultaneously presents a sheet that depends on optional counter \
        state and fires off an effect that will load this state a second later.

        """
    }
}
