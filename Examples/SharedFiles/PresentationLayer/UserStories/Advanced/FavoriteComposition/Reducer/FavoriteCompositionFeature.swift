//
//  FavoriteCompositionReducer.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import OldTCA

// MARK: - FavoriteCompositionFeature

public struct FavoriteCompositionFeature: ReducerProtocol {
    
    // MARK: - Feature
    
    public var body: some ReducerProtocol<FavoriteCompositionState, FavoriteCompositionAction> {
        EmptyReducer()
            .forEach(\.palettes, action: /FavoriteCompositionAction.palette(id:action:)) {
                PaletteFeature()
            }
            .forEach(\.users, action: /FavoriteCompositionAction.user(id:action:)) {
                UserFeature()
            }
            .forEach(\.books, action: /FavoriteCompositionAction.book(id:action:)) {
                BookFeature()
            }
            .forEach(\.news, action: /FavoriteCompositionAction.news(id:action:)) {
                NewsFeature()
            }
    }
}
