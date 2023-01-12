//
//  BookService.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import Combine
import Foundation

// MARK: - BookService

public protocol BookService {

    /// Update some book's isBookmark state
    /// - Returns: result publisher
    func refresh(bookID: String, isBookmark: Bool) -> AnyPublisher<Bool, Error>
}
