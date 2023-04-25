//
//  NewsView.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import TCA
import SwiftUI

// MARK: - NewsView

/// A visual representation of `News` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<NewsState, NewsAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct NewsView: View {

    // MARK: - Properties

    /// The store powering the `News` feature
    public let store: StoreOf<NewsFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                HStack {
                    if let image = viewStore.avatar {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 44, height: 44)
                            .clipShape(Circle())
                            .padding([.bottom, .top, .trailing], 10)
                    } else {
                        ActivityIndicator()
                            .padding()
                    }
                    VStack(alignment: .leading) {
                        Text(viewStore.news.publisherName)
                            .font(.system(size: 17, weight: .semibold))
                        Text(viewStore.news.date)
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                HStack {
                    Text(viewStore.news.text)
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                }
                HStack {
                    Spacer()
                    Text("\(viewStore.news.thumbsCount)")
                        .font(.system(size: globalFontSize, design: .rounded).monospacedDigit())
                        .foregroundColor(.init(hex: "0496ff"))
                    FavoriteButton(
                        store: store.scope(
                            state: \.favorite,
                            action: NewsAction.favorite
                        )
                    )
                    .frame(width: 20, height: 20)
                    .padding([.bottom, .top], 10)
                    .foregroundColor(.init(hex: "0496ff"))
                }
            }.onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}
