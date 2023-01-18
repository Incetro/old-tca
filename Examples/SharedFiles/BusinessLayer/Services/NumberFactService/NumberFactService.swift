//
//  NumberFactService.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import Combine

// MARK: - NumberFactAPIError

public enum NumberFactAPIError: Error, Equatable {
    case unknown(String)
}

// MARK: - NumberFactService

public protocol NumberFactService {

    /// Obtain some number's fact
    /// - Returns: number fact string
    func obtain(number: Int) -> AnyPublisher<String, NumberFactAPIError>
}
