//
//  MainFeature.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import TCA

// MARK: - MainFeature

public struct MainFeature: ReducerProtocol {
    
    public var body: some ReducerProtocol<MainState, MainAction> {
        Scope(state: \.counter, action: /MainAction.counter) {
            CounterFeature()
        }
        Scope(state: \.doubleCounter, action: /MainAction.doubleCounter) {
            DoubleCounterFeature()
        }
        Scope(state: \.analyzableCounter, action: /MainAction.analyzableCounter) {
            AnalyzableCounterFeature()
        }
        Scope(state: \.fibonacciCounter, action: /MainAction.fibonacciCounter) {
            FibonacciCounterFeature()
        }
        Scope(state: \.scrambler, action: /MainAction.scrambler) {
            ScramblerFeature()
        }
        Reduce { state, action in
            switch action {
            case .onAppear:
                state = .init()
            default:
                break
            }
            return .none
        }
    }
}