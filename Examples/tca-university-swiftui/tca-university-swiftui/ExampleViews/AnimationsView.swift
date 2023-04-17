//
//  AnimationsView.swift
//  verse-examples
//
//  Created by incetro on 06/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA
import SwiftUI

// MARK: - AnimationsView

/// A visual representation of `Animations` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<AnimationsState, AnimationsAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct AnimationsView: View {

    // MARK: - Properties

    /// The store powering the `EffectDebounce` feature
    public let store: StoreOf<AnimationsFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Text(template: Constants.summary)
                    .minimumScaleFactor(0.62)
                    .standard
                    .padding(16)
                ZStack {
                    let size = LayoutConstants.ringImageWidth
                    ProgressRingView(progress: viewStore.progress)
                        .frame(width: size, height: size)
                    if #available(iOS 15.0, *) {
                        Text("\(Int(viewStore.progress * 100))%")
                            .font(.system(size: 55, weight: .bold, design: .rounded))
                            .monospacedDigit()
                    }
                }
                Spacer()
                HStack {
                    let width = LayoutConstants.stackWidth
                    let height: CGFloat = 50
                    Spacer()
                    Button("No animation") {
                        viewStore.send(.randomProgressButtonTapped)
                    }
                    .frame(maxWidth: width, minHeight: height)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(13)
                    .semibold
                    .standard
                    Spacer()
                    Button("Animation") {
                        viewStore.send(.randomProgressButtonTapped, animation: .easeOut(duration: 0.62))
                    }
                    .frame(maxWidth: width, minHeight: height)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(13)
                    .semibold
                    .standard
                    Spacer()
                }
            }
            .onAppear {
                viewStore.send(.randomProgressButtonTapped)
            }
            .navigationTitle("Animations")
        }
    }
}

// MARK: - Constants

extension AnimationsView {

    private enum Constants {

        static let summary = """
        This screen demonstrates how changes to module state can drive animations. Because the \
        `Store` processes actions sent to it synchronously you can typically perform animations \
        in the VERSE just as you would in regular SwiftUI.

        To animate the changes made to state when an action is sent to the store you can pass along an \
        explicit animation.

        Tap on the `Randomize` button to see the animation that changes `ProgressRingView` progress

        """
    }
}

// MARK: - LayoutConstants

extension AnimationsView {
    
    private enum LayoutConstants {
        static let ringImageWidth = UIScreen.main.bounds.width - 100 - 64
        static let stackWidth = (UIScreen.main.bounds.width - 32 * 3) / 2
    }
}
