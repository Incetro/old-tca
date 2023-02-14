//
//  ButtonState.swift
//  
//
//  Created by Dmitry Savinov on 14.02.2023.
//

import Foundation

// MARK: - ButtonState

extension ButtonState {
    
    /// Returns `cancel` button instance
    /// - Parameters:
    ///   - label: button title
    ///   - action: button action
    /// - Returns: `cancel` button instance
    public static func cancel(
        _ label: String,
        send action: ButtonStateAction<Action> = .send(nil)
    ) -> Self {
        Self(role: .cancel, action: action) {
            .init(label)
        }
    }

    /// Returns `cancel` button instance
    /// - Parameters:
    ///   - action: button action
    /// - Returns: `cancel` button instance
    public static func cancel(
        send action: ButtonStateAction<Action> = .send(nil)
    ) -> Self {
        Self(role: .cancel, action: action) {
            .init("")
        }
    }

    /// Returns `default` button instance
    /// - Parameters:
    ///   - label: button title
    ///   - action: button action
    /// - Returns: `default` button instance
    public static func `default`(
        _ label: String,
        send action: ButtonStateAction<Action> = .send(nil)
    ) -> Self {
        Self(action: action) {
            .init(label)
        }
    }

    /// Returns `destructive` button instance
    /// - Parameters:
    ///   - label: button title
    ///   - action: button action
    /// - Returns: `destructive` button instance
    public static func destructive(
        _ label: String,
        send action: ButtonStateAction<Action> = .send(nil)
    ) -> Self {
        Self(role: .destructive, action: action) {
            .init(label)
        }
    }
}

