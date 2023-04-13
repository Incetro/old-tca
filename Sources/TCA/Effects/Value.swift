//
//  File.swift
//  
//
//  Created by Dmitry Savinov on 14.02.2023.
//

import Foundation

// MARK: - Value

extension EffectPublisher {

    /// Returns an effect that will return the given value
    ///
    /// ```
    /// return .value(Action.referralToast)
    /// ```
    ///
    /// - Parameters:
    ///     - value: target value
    /// - Returns: An effect that will be executed after `dueTime`
    public static func value(_ value: Output) -> Self {
        .init(value: value)
    }
}
