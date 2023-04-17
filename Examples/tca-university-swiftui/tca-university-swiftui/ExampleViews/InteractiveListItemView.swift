//
//  InteractiveListItemView.swift
//  verse-examples
//
//  Created by incetro on 09/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA
import SwiftUI

// MARK: - InteractiveListItemView

/// A visual representation of `InteractiveListItem` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<InteractiveListItemState, InteractiveListItemAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct InteractiveListItemView: View {

    // MARK: - Properties

    /// The store powering the `EffectDebounce` feature
    public let store: StoreOf<InteractiveListItemFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            HStack {
                Circle()
                    .fill(Color(hex: viewStore.color))
                    .frame(width: 20, height: 20)
                Text(viewStore.title)
                    .standard
                Spacer()
                Image(systemName: viewStore.image)
                    .renderingMode(.original)
                Button(
                    action: {
                        viewStore.send(.checkBoxToggled)
                        let impact = UISelectionFeedbackGenerator()
                        impact.selectionChanged()
                    }
                ) {
                    Image(
                        systemName: viewStore.isChecked
                          ? "checkmark.square"
                          : "square"
                    )
                }
                .buttonStyle(PlainButtonStyle())
            }
            .foregroundColor(viewStore.isChecked ? .gray : nil)
            .frame(height: 40)
        }
    }
}

// MARK: - Aliases

public typealias InteractiveListItemStore = Store<InteractiveListItemState, InteractiveListItemAction>
