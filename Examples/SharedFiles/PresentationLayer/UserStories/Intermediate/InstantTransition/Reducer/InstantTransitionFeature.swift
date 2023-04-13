//
//  InstantTransitionFeature.swift
//  verse-examples
//
//  Created by incetro on 08/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA
import Foundation

// MARK: - InstantTransitionFeature

public struct InstantTransitionFeature: ReducerProtocol {
    
    // MARK: - ReducerProtocol
    
    public var body: some ReducerProtocol<InstantTransitionState, InstantTransitionAction> {
        Reduce { state, action in
            switch action {
            case .setNavigation(isActive: true):
                state.isNavigationActive = true
                return Effect(value: InstantTransitionAction.loadingCompleted)
                    .delay(for: 1, scheduler: DispatchQueue.main)
                    .eraseToEffect()
            case .setNavigation(isActive: false):
                state.isNavigationActive = false
                state.counter = nil
                return .none
            case .loadingCompleted:
                state.counter = CounterState()
                return .none
            default:
                return .none
            }
        }
        .ifLet(\.counter, action: /InstantTransitionAction.counter) {
            CounterFeature()
        }
    }
}
