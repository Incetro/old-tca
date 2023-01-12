//
//  NumberFactServiceImplementation.swift
//  verse-swiftui-examples
//
//  Created by incetro on 10/14/21.
//

import Combine
import Foundation

// MARK: - NumberFactServiceImplementation

public final class NumberFactServiceImplementation {

    // MARK: - Properties

    /// URLSession instance
    private let session: URLSession

    // MARK: - Initializers

    /// Default initializer
    /// - Parameter session: URLSession instance
    public init(session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: - NumberFactService

extension NumberFactServiceImplementation: NumberFactService {

    public func obtain(number: Int) -> AnyPublisher<String, NumberFactAPIError> {
        let url = URL(string: "http://numbersapi.com/\(number)").unsafelyUnwrapped
        return session
            .dataTaskPublisher(for: url)
            .map { data, _ in String(decoding: data, as: UTF8.self) }
            .mapError{ error in
                .unknown(error.localizedDescription)
            }
            .delay(for: 2, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
