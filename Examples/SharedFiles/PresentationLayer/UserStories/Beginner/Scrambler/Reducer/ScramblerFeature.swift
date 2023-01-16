//
//  ScramblerFeature.swift
//  verse-examples
//
//  Created by incetro on 10/12/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA
import Foundation

// MARK: - ScramblerFeature

public struct ScramblerFeature: ReducerProtocol {
    
    public func scramble(_ length: Int) -> String {
        let notations = ["F", "B", "R", "U", "D", "L"].map {
            [$0, $0 + "'", $0 + "2"]
        }
        var previousFace = 0
        var randomFace = Int(arc4random_uniform(6))
        var result = ""
        guard length > 0 else { return "🚓" }
        for i in 0..<length {
            while previousFace == randomFace {
                randomFace = Int(arc4random_uniform(6))
            }
            previousFace = randomFace
            let randomTurn = Int(arc4random_uniform(3))
            let notation = notations[randomFace][randomTurn]
            if i == 0 {
                result += notation
            } else {
                result += " \(notation)"
            }
        }
        return result
    }
    
    public func reduce(into state: inout ScramblerState, action: ScramblerAction) -> EffectTask<ScramblerAction> {
        switch action {
        case .plusButtonTapped:
            state.currentScrambleLength += 1
        case .minusButtonTapped:
            state.currentScrambleLength -= 1
        default:
            break
        }
        state.scramble = scramble(state.currentScrambleLength)
        return .none
    }
}
