//
//  SimpleOptionalReducer.swift
//  TCA-examples
//
//  Created by incetro on 31/10/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA

// MARK: - SimpleOptionalFeature

public struct SimpleOptionalFeature: ReducerProtocol {
    
    public var body: some ReducerProtocol<SimpleOptionalState, SimpleOptionalAction> {
        Reduce { state, action in
            switch action {
            case .toggleOptional:
                state.counter = state.counter == nil ? CounterState() : nil
                return .none
            default:
                return .none
            }
        }
        .ifLet(\.counter, action: /SimpleOptionalAction.counter) {
            CounterFeature()
        }
    }
}
