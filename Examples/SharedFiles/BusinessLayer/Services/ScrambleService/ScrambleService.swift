//
//  ScrambleService.swift
//  verse-swiftui-examples
//
//  Created by incetro on 12/10/21.
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
