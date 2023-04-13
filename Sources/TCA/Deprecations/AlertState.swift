//
//  AlertState.swift
//  
//
//  Created by Dmitry Savinov on 14.02.2023.
//

import Foundation

// MARK: - AlertState

extension AlertState {
    
    /// Dismissal initializer
    /// - Parameters:
    ///   - title: alert title string
    ///   - message: alert message
    ///   - dismissButton: the main button in the alert
    public init(
        title: String,
        message: String? = nil,
        dismissButton: ButtonState<Action>? = nil
    ) {
        self.init(
            title: .init(title),
            message: message.map(TextState.init),
            dismissButton: dismissButton
        )
    }
    
    /// Two-buttons initializer
    /// - Parameters:
    ///   - title: alert title string
    ///   - message: alert message string
    ///   - primaryButton: a main button
    ///   - secondaryButton: a secondary button
    public init(
        title: String,
        message: String? = nil,
        primaryButton: ButtonState<Action>,
        secondaryButton: ButtonState<Action>
    ) {
        self.init(
            title: .init(title),
            message: message.map(TextState.init),
            primaryButton: primaryButton,
            secondaryButton: secondaryButton
        )
    }
}
