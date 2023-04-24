//
//  LifecycleTimerFeature.swift
//  verse-examples
//
//  Created by incetro on 16/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA
import Foundation

// MARK: - LifecycleTimerFeature

public struct LifecycleTimerFeature: ReducerProtocol {
    
    // MARK: - Properties
    
    @Dependency(\.continuousClock) var clock
    
    private struct LifecycleTimerID: Hashable {}
    
    // MARK: - Feature
    
    public var body: some ReducerProtocol<LifecycleTimerState, LifecycleTimerAction> {
        Reduce { state, action in
            switch action {
            case .timer:
                return .none
            }
        }
        Scope(state: \.count, action: /LifecycleTimerAction.timer) {
            TimerFeature()
                .lifecycle(
                  onAppear: .run { send in
                    for await _ in self.clock.timer(interval: .seconds(1)) {
                      await send(.tick)
                    }
                  }
                  .cancellable(id: LifecycleTimerID.self),
                  onDisappear: .cancel(id: LifecycleTimerID.self)
                )
        }
    }
}
