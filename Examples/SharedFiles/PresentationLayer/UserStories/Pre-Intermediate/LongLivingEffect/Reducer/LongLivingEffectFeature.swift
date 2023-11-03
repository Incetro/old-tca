//
//  LongLivingEffectFeature.swift
//  verse-examples
//
//  Created by incetro on 22/02/2022.
//  Copyright © 2022 Incetro Inc. All rights reserved.
//
import OldTCA
import UIKit

// MARK: - LongLivingEffectFeature

public struct LongLivingEffectFeature: ReducerProtocol {
    
    // MARK: - Identifiers
    
    private struct UserDidTakeScreenshotID: Hashable {}
    
    // MARK: - Properties
    
    private let userDidTakeScreenshot = Effect(
        NotificationCenter
            .default
            .publisher(for: UIApplication.userDidTakeScreenshotNotification)
            .map { _ in () }
            .eraseToEffect()
    )
    
    // MARK: - ReducerProtocol
    
    public var body: some ReducerProtocol<LongLivingEffectState, LongLivingEffectAction> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return userDidTakeScreenshot
                    .map { LongLivingEffectAction.userDidTakeScreenshot }
                    .cancellable(id: UserDidTakeScreenshotID(), cancelInFlight: true)
            case .onDisappear:
                return .cancel(id: UserDidTakeScreenshotID())
            case .userDidTakeScreenshot:
                state.screenshotsCount += 1
            }
            return .none
        }
    }
}
