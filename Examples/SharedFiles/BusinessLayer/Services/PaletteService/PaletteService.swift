//
//  PaletteService.swift
//  verse-swiftui-examples
//
//  Created by incetro on 11/12/21.
//

import Combine

// MARK: - PaletteService

public protocol PaletteService {

    /// Update some palette's isFavorite state
    /// - Returns: result publisher
    func refresh(paletteID: String, isFavorite: Bool) -> AnyPublisher<Bool, Error>
}
