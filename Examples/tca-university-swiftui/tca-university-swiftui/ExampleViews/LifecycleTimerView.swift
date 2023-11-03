//
//  LifecycleTimerView.swift
//  verse-examples
//
//  Created by incetro on 16/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import OldTCA
import SwiftUI

// MARK: - LifecycleTimerView

/// A visual representation of `LifecycleTimer` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<LifecycleTimerState, LifecycleTimerAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct LifecycleTimerView: View {

    // MARK: - Properties

    /// The store powering the `Timers` feature
    public let store: StoreOf<LifecycleTimerFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Text(template: Constants.summary)
                    .minimumScaleFactor(0.62)
                    .standard
                    .padding([.top, .leading, .trailing], 16)
                Spacer()
                ZStack {
                    let size = UIScreen.main.bounds.width - 100 - 64
                    ProgressRingView(progress: Double(viewStore.count) / 100.0)
                        .frame(width: size, height: size)
                        .animation(.easeInOut(duration: 0.62))
                    Text("\(Int(viewStore.count))%")
                        .font(.system(size: 55, weight: .bold, design: .rounded).monospacedDigit())
                        .transition(.opacity)
                        .onAppear {
                            viewStore.send(.timer(.onAppear))
                        }
                        .onDisappear {
                            viewStore.send(.timer(.onDisappear))
                        }
                }.padding([.bottom], 16)
                Spacer()
                HStack {
                    let width = (UIScreen.main.bounds.width - 16 * 3) / 2
                    let height: CGFloat = 50
                    Button(action: { viewStore.send(.timer(.wrapped(.decrement))) }) {
                        Text("Decrement")
                            .frame(width: width, height: height)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                            .semibold
                            .standard
                    }
                    Button(action: { viewStore.send(.timer(.wrapped(.increment))) }) {
                        Text("Increment")
                            .frame(width: width, height: height)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                            .semibold
                            .standard
                    }
                }
            }.navigationTitle("Lifecycle")
        }
    }
}

// MARK: - Constants

extension LifecycleTimerView {

    enum Constants {

        static let summary = """
        This example demonstrates how to trigger effects when a view appears, and cancel effects when a view \
        disappears. This can be helpful for starting up a feature's long living effects, such as timers, \
        location managers, motion managers, etc. when that feature is first presented.

        To accomplish this we define a higher-order reducer that enhances any reducer with two additional \
        actions: `.onAppear` and `.onDisappear`, and a way to automate running effects when those actions \
        are sent to the store.

        """
    }
}
