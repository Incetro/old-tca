//
//  ScrambleService.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import Combine
import Foundation

// MARK: - ScrambleServiceAction

public enum ScrambleServiceAction: Equatable {
    case scramble(String)
}

// MARK: - ScrambleService

public protocol ScrambleService {

    /// Obtain a random scramble
    ///
    /// - Parameters:
    ///   - length: scramble length (moves count)
    func generateScramble(length: Int) -> AnyPublisher<String, Never>
}
