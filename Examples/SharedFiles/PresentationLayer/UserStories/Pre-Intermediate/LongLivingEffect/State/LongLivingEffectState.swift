//
//  LongLivingEffectState.swift
//  verse-examples
//
//  Created by incetro on 22/02/2022.
//  Copyright © 2022 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - LongLivingEffectState

/// `LongLivingEffect` module state
///
/// Basically, `LongLivingEffectState` is a type that describes the data
/// `LongLivingEffect` feature needs to perform its logic and render its UI.
public struct LongLivingEffectState: Equatable, Codable {

    // MARK: - Properties

    /// Count of taken screenshots
    public var screenshotsCount = 0
}
