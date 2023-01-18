//
//  FibonacciCounterFeature.swift
//  verse-examples
//
//  Created by incetro on 02/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA
import Darwin

// MARK: - Reducer

public struct FibonacciCounterFeature: ReducerProtocol {
    
    public var body: some ReducerProtocol<FibonacciCounterState, FibonacciCounterAction> {
        Scope(state: \.counter, action: /FibonacciCounterAction.counter) {
            CounterFeature()
        }
        Reduce { state, action in
            switch action {
            case .counter:
                guard state.counter.count > 0 else {
                    state.fibonacchiText = "🚓"
                    return .none
                }
                state.fibonacchiText = state.counter.count.isFibonacci ? "✅" : "❌"
            }
            return .none
        }
    }
}

// MARK: - Int

private extension Int {

    var isPerfectSquare: Bool {
        let s = Int(sqrt(Double(self)))
        return s * s == self
    }

    var isFibonacci: Bool {
        let firstCondition = (5 * self * self + 4).isPerfectSquare
        let secondCondition = (5 * self * self - 4).isPerfectSquare
        return firstCondition || secondCondition
    }
}
