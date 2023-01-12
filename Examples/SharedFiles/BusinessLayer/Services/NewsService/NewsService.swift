//
//  NewsService.swift
//  verse-swiftui-examples
//
//  Created by incetro on 11/13/21.
//

import Combine
import Foundation

// MARK: - NewsService

public protocol NewsService {

    /// Update some news' isThumbUp state
    /// - Returns: result publisher
    func refresh(newsID: Int, isThumbUp: Bool) -> AnyPublisher<Bool, Error>
}
