//
//  DoubleCounterFeature.swift
//  TCA-examples
//
//  Created by incetro on 13/10/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import OldTCA

// MARK: - DoubleCounterFeature

public struct DoubleCounterFeature: ReducerProtocol {
    
    // MARK: - ReducerProtocol
    
    public var body: some ReducerProtocol<DoubleCounterState, DoubleCounterAction> {
        Scope(state: \.counter1, action: /DoubleCounterAction.counter1) {
            CounterFeature()
        }
        Scope(state: \.counter2, action: /DoubleCounterAction.counter2) {
            CounterFeature()
        }
    }
}

