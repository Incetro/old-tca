//
//  UserView.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import TCA
import SwiftUI

// MARK: - UserView

/// A visual representation of `User` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<UserState, UserAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct UserView: View {

    // MARK: - Properties

    /// The store powering the `User` feature
    public let store: StoreOf<UserFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            HStack {
                VStack(alignment: .center) {
                    if let image = viewStore.avatar {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 44, height: 44)
                            .clipShape(Circle())
                    } else {
                        ActivityIndicator()
                    }
                }
                VStack(alignment: .leading) {
                    Text(viewStore.username)
                        .font(.system(size: 17, weight: .semibold))
                    Text(viewStore.name)
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                }
                Spacer()
                VStack(alignment: .center) {
                    FavoriteButton(
                        store: store.scope(
                            state: \.favorite,
                            action: UserAction.favorite
                        )
                    ).foregroundColor(.init(hex: "fca311"))
                }
            }.onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}
