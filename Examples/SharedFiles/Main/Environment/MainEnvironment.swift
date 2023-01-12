//
//  MainEnvironment.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import Foundation

// MARK: - MainEnvironment

/// `Main` module environment.
///
/// `Environment` is a type that holds any dependencies the feature needs,
/// such as API clients, analytics clients, etc.
public struct MainEnvironment {
}

// MARK: - Convenience

/// Here we have some assistive properties which will help us
/// to use `Main` module with `pullback`, `forEach`, etc. more easily
public extension MainEnvironment {

    /// Real environment wrapped in this property.
    ///
    /// You can use this:
    ///
    ///     mainReducer.pullback(
    ///         state: \.main,
    ///         action: /AppAction.main,
    ///         environment: .real
    ///     )
    ///
    /// Instead of this:
    ///
    ///     mainReducer.pullback(
    ///         state: \.main,
    ///         action: /AppAction.main,
    ///         environment: MainComposer.environment()
    ///     )
    static var real: Self {
        MainEnvironment()
    }
}
