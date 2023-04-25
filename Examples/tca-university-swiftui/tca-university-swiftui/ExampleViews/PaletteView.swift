//
//  PaletteView.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import TCA
import SwiftUI

// MARK: - PaletteView

/// A visual representation of `Palette` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<PaletteState, PaletteAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct PaletteView: View {

    // MARK: - Properties

    /// The store powering the `Palette` feature
    public let store: StoreOf<PaletteFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewStore.palette.colors, id: \.self) { color in
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.init(hex: color))
                        }
                    }
                }
                Spacer()
                FavoriteButton(
                    store: store.scope(
                        state: \.favorite,
                        action: PaletteAction.favorite
                    )
                )
            }
        }
    }
}
