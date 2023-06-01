//
//  FavoriteButton.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import SwiftUI
import TCA

// MARK: - FavoriteButton

struct FavoriteButton<ID>: View where ID: Hashable {

    // MARK: - Properties
    
    /// The store powering the `Favorite` feature
    public let store: StoreOf<FavoriteFeature<ID>>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            Button(action: { viewStore.send(.favoriteButtonTapped) }) {
                Image(systemName: viewStore.imageName)
            }
            .alert(store.scope(state: \.alert), dismiss: .alertDismissed)
        }
    }
}
