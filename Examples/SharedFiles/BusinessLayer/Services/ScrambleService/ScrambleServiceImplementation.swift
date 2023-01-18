//
//  ScrambleServiceImplementation.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import Combine
import Foundation

// MARK: - ScrambleServiceImplementation

final class ScrambleServiceImplementation {

    // MARK: - Private

    private func scramble(length: Int) -> String {

        let notations = ["F", "B", "R", "U", "D", "L"].map {
            [$0, $0 + "'", $0 + "2"]
        }

        var previousFace = 0
        var randomFace = Int(arc4random_uniform(6))
        var result = ""

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
}

// MARK: - ScrambleService

extension ScrambleServiceImplementation: ScrambleService {

    public func generateScramble(length: Int) -> AnyPublisher<String, Never> {
        Future { completion in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                completion(.success(self.scramble(length: length)))
            }
        }.eraseToAnyPublisher()
    }
}
