//
//  TimersFeature.swift
//  verse-examples
//
//  Created by incetro on 06/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA
import Foundation

// MARK: - TimersFeature

public struct TimersFeature: ReducerProtocol {
    
    // MARK: - Identifiars
    
    private struct TimerID: Hashable {}
    
    // MARK: - ReducerProtocol
    
    public var body: some ReducerProtocol<TimersState, TimersAction> {
        Reduce { state, action in
            switch action {
            case .timerButtonTapped:
                state.isTimerActive.toggle()
                return .when(
                    state.isTimerActive,
                    then: Effect.timer(
                        id: TimerID(),
                        every: 1,
                        on: DispatchQueue.main
                    ).map { _ in TimersAction.timerTick },
                    else: .cancel(id: TimerID())
                )
            case .timerTick:
                if state.progress >= 1 {
                    state.progress = 0
                } else {
                    state.progress += 0.13
                }
                state.progress = min(1, state.progress)
            case .onDisappear:
                state.progress = 0
                return .cancel(id: TimerID())
            }
            return .none
        }
    }
}
