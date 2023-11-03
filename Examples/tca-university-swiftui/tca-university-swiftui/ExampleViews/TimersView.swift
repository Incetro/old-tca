//
//  TimersView.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
//

import OldTCA
import SwiftUI

// MARK: - TimersView

/// A visual representation of `Timers` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<TimersState, TimersAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct TimersView: View {

    // MARK: - Properties

    /// The store powering the `Timers` feature
    public let store: StoreOf<TimersFeature>
    
    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Text(template: Constants.summary)
                    .minimumScaleFactor(0.62)
                    .standard
                    .padding(16)
                ZStack {
                    let size = UIScreen.main.bounds.width - 100 - 64
                    ProgressRingView(progress: viewStore.progress)
                        .frame(width: size, height: size)
                        .animation(.easeInOut(duration: 0.62))
                    if #available(iOS 15.0, *) {
                        Text("\(Int(viewStore.progress * 100))%")
                            .font(.system(size: 55, weight: .bold, design: .rounded))
                            .monospacedDigit()
                            .transition(.opacity)
                    }
                }
                Spacer()
                HStack {
                    let width = UIScreen.main.bounds.width - 16 * 2
                    let height: CGFloat = 50
                    Button(action: { viewStore.send(.timerButtonTapped) }) {
                        HStack {
                            Text(viewStore.isTimerActive ? "Stop" : "Start")
                        }
                        .frame(width: width, height: height)
                        .foregroundColor(.white)
                        .background(viewStore.isTimerActive ? Color.red : Color.blue)
                        .cornerRadius(13)
                        .semibold
                        .standard
                    }
                }
            }
            .onDisappear {
                viewStore.send(.onDisappear)
            }
            .navigationTitle("Timers")
        }
    }
}

// MARK: - Constants

extension TimersView {

    private enum Constants {

        static let summary = """
        This example demonstrates how to work with timers in the VERSE.

        Although the Combine framework comes with a `Timer.publisher` API, and it is possible to use \
        that API in the VERSE, it is not easy to test. That is why we have provided an \
        `Effect.timer` API that works with schedulers and can be tested.

        """
    }
}
