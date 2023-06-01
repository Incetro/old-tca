//
//  LifecycleFeature.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 19.04.2023.
//

import TCA
import Foundation

public struct LifecycleFeature<Wrapped: ReducerProtocol>: ReducerProtocol where Wrapped.Action: Equatable {
    
  let wrapped: Wrapped
  let onAppear: EffectTask<Wrapped.Action>
  let onDisappear: EffectTask<Never>

    public var body: some ReducerProtocol<Wrapped.State, LifecycleAction<Wrapped.Action>> {
        Reduce { state, lifecycleAction in
            switch lifecycleAction {
            case .onAppear:
                return onAppear.map(Action.wrapped)
                
            case .onDisappear:
                return onDisappear.fireAndForget()
                
            case .wrapped:
                return .none
            }
        }
        Scope(state: \.self, action: /Action.wrapped) {
            self.wrapped
        }
    }
}

extension ReducerProtocol where Self.Action: Equatable {
  func lifecycle(
    onAppear: EffectTask<Action>,
    onDisappear: EffectTask<Never> = .none
  ) -> LifecycleFeature<Self> {
      LifecycleFeature(wrapped: self, onAppear: onAppear, onDisappear: onDisappear)
  }
}
