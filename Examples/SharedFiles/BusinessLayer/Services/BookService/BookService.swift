//
//  BookService.swift
//  verse-swiftui-examples
//
//  Created by incetro on 11/13/21.
//

import Combine
import Foundation

// MARK: - BookService

public protocol BookService {

    /// Update some book's isBookmark state
    /// - Returns: result publisher
    func refresh(bookID: String, isBookmark: Bool) -> AnyPublisher<Bool, Error>
}
