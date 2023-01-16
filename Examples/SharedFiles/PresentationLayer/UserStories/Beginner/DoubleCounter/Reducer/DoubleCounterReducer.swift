//
//  DoubleCounterFeature.swift
//  verse-examples
//
//  Created by incetro on 13/10/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA

// MARK: - DoubleCounterFeature

public struct DoubleCounterFeature: ReducerProtocol {
    
    public var body: some ReducerProtocol<DoubleCounterState, DoubleCounterAction> {
        Reduce { state, action in
            .none
        }
        Scope(state: \.counter1, action: /DoubleCounterAction.counter1) {
            CounterFeature()
        }
        Scope(state: \.counter2, action: /DoubleCounterAction.counter2) {
            CounterFeature()
        }
    }
}
