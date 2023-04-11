//
//  LongLivingEffectView.swift
//  verse-examples
//
//  Created by incetro on 22/02/2022.
//  Copyright © 2022 Incetro Inc. All rights reserved.
//

import TCA
import SwiftUI

// MARK: - LongLivingEffectView

/// A visual representation of `LongLivingEffect` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<LongLivingEffectState, LongLivingEffectAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct LongLivingEffectView: View {

    // MARK: - Properties

    /// The store powering the `SimpleEffect` feature
    public let store: StoreOf<LongLivingEffectFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text(template: Constants.summary).standard) {
                    Text("Screenshot has been taken \(viewStore.screenshotsCount) times")
                }.textCase(nil)
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
            .navigationBarTitle("Long-living effect")
        }
    }
}

// MARK: - Constants

extension LongLivingEffectView {

    enum Constants {

        static let summary = """
        This screen demonstrates how to create long-living effects in the VERSE.

        Here you have only 1 number. It's a count of screenshots you made on the screen.
        When you make screenshot it will increase the number and it works until you leave the screen.

        """
    }
}
