//
//  CounterView.swift
//  verse-swiftui-examples
//
//  Created by incetro on 10/13/21.
//

import TCA
import SwiftUI

// MARK: - Aliases

public typealias CounterView = StepperView

// MARK: - CounterView

/// A visual representation of `Counter` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<State, Action>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct SimpleCounterView: View {

    // MARK: - Properties

    /// The store powering the `Counter` feature
    public let store: StoreOf<CounterFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            HStack {
                Button("-") {
                    viewStore.send(.decrementButtonTapped)
                }
                Text("\(viewStore.count)")
                Button("+") {
                    viewStore.send(.incrementButtonTapped)
                }
            }
        }
    }
}

// MARK: - CounterView_Previews

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleCounterView(
            store: .init(
                initialState: CounterState(),
                reducer: CounterFeature()
            )
        )
    }
}
