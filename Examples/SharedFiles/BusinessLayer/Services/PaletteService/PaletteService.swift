//
//  PaletteService.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import Combine

// MARK: - PaletteService

public protocol PaletteService {

    /// Update some palette's isFavorite state
    /// - Returns: result publisher
    func refresh(paletteID: String, isFavorite: Bool) -> AnyPublisher<Bool, Error>
}
