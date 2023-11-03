//
//  PaletteReducer.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import OldTCA

// MARK: - PaletteFeature

public struct PaletteFeature: ReducerProtocol {
    
    // MARK: - Dependencies
    
    /// PaletteService instance
    @Dependency(\.paletteService) var paletteService
    
    // MARK: - Feature
    
    public var body: some ReducerProtocol<PaletteState, PaletteAction> {
        Scope(state: \.favorite, action: /PaletteAction.favorite) {
            FavoriteFeature { id, isFavorite in
                paletteService
                    .refresh(paletteID: id, isFavorite: isFavorite)
                    .eraseToEffect()
            }
        }
        EmptyReducer()
    }
}
