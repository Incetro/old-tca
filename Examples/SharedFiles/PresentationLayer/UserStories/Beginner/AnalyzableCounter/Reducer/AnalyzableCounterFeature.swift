//
//  AnalyzableCounterFeature.swift
//  verse-examples
//
//  Created by incetro on 02/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA

// MARK: - AnalyzableCounterFeature

public struct AnalyzableCounterFeature: ReducerProtocol {
    
    public var body: some ReducerProtocol<AnalyzableCounterState, AnalyzableCounterAction> {
        Reduce { state, action in
            switch action {
            case .counter:
                state.eventsCount += 1
            }
            state.max = max(state.max, state.counter.count)
            state.min = min(state.min, state.counter.count)
            return .none
        }
        Scope(state: \.counter, action: /AnalyzableCounterAction.counter) {
            CounterFeature()
        }
    }
}
