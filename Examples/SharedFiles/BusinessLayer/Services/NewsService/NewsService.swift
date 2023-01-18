//
//  NewsService.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import Combine
import Foundation

// MARK: - NewsService

public protocol NewsService {

    /// Update some news' isThumbUp state
    /// - Returns: result publisher
    func refresh(newsID: Int, isThumbUp: Bool) -> AnyPublisher<Bool, Error>
}
