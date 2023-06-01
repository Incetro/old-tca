//
//  TimerFeature.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 19.04.2023.
//

import TCA
import Foundation

// MARK: - TimerFeature

public struct TimerFeature: ReducerProtocol {
    
    // MARK: - Feature
    
    public var body: some ReducerProtocol<Int, TimerAction> {
        Reduce { state, action in
            switch action {
            case .decrement:
              state -= 1
            case .increment, .tick:
              state += 1
            }
            if state != 100 {
                state = max(0, state) % 100
            }
            return .none
        }
    }
}
