//
//  FlexibleBindingsView.swift
//  verse-examples
//
//  Created by Nikita Lezya on 29/10/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA
import SwiftUI

// MARK: - FlexibleBindingsView

/// A visual representation of `FlexibleBindings` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<FlexibleBindingsState, FlexibleBindingsAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct FlexibleBindingsView: View {

    // MARK: - Properties

    /// FlexibleBindingsStore instance
    public let store: StoreOf<FlexibleBindingsFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text(template: Constants.summary).standard) {

                    Picker("", selection: viewStore.binding(\.$pickedColor)) {
                        ForEach(viewStore.colors, id: \.self) {
                            Text($0.rawValue.capitalized).tag($0.color)
                        }
                    }
                    .pickerStyle(.segmented)
                    .disabled(viewStore.toggleEnabled)

                    TextField(
                        "Enter your text",
                        text: viewStore.binding(\.$text)
                    )
                    .disabled(viewStore.toggleEnabled)
                    .standard

                    Toggle(isOn: viewStore.binding(\.$toggleEnabled))
                    { Text("Disable other controls").standard }
                    .toggleStyle(SwitchToggleStyle(tint: viewStore.pickedColor.color))

                    HStack {
                        Text("This counter changes slider's max value").standard
                        Spacer()
                        CounterView(
                            store: store.scope(
                                state: \.counterState,
                                action: FlexibleBindingsAction.counter
                            )
                        )
                        .buttonStyle(BorderlessButtonStyle())
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                    }.disabled(viewStore.toggleEnabled)

                    HStack {
                        Text("Slider value: \(Int(viewStore.sliderValue))").standard
                        Spacer(minLength: Constants.interspacing)
                        Slider(
                            value: viewStore.binding(\.$sliderValue),
                            in: 0...Double(viewStore.counterState.count),
                            step: 1
                        ).disabled(viewStore.toggleEnabled)
                    }

                    Button("Reset all controls") {
                        viewStore.send(.resetControls)
                    }
                    .standard
                }.textCase(nil)
            }.accentColor(viewStore.pickedColor.color)
        }.navigationBarTitle("Flexible Bindings")
    }
}

// MARK: - Constants

extension FlexibleBindingsView {

    enum Constants {

        static let interspacing: CGFloat = 16
        static let summary = """
        This screen demonstrates how bindings between views and state can be achieved with the VERSE.
        On this particular screen bindings set directly via KeyPath binding without setting the state in corresponding reducer.

        It is useful to compare this example to the Simple Bindings case

        Any view change updates the state and consequently the state affects other views if they bound to that state.

        • Changing a picker value updates accentColor of all views
        • TextField and Slider are just bound to the state
        • SwitchToggle is responsible for disabling all other controls excluding Reset button
        • Counter affects the maximum available value of the Slider
        • Reset Button resets state to the default value

        """
    }
}
