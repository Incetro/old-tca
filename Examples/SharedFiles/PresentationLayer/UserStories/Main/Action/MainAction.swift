//
//  MainAction.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import Foundation

// MARK: - MainAction

/// All available `Main` module actions.
///
/// It's a type that represents all of the actions that can happen in `Main` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum MainAction: Equatable {

    case onAppear
    
    // MARK: - Beginner

    case counter(CounterAction)
    case doubleCounter(DoubleCounterAction)
    case analyzableCounter(AnalyzableCounterAction)
    case fibonacciCounter(FibonacciCounterAction)
    case scrambler(ScramblerAction)
    
    // MARK: - Elementary
}
