//
//  Book.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import Foundation

// MARK: - Book

public struct Book: Equatable {

    // MARK: - Properties

    /// Book name
    public let name: String

    /// Author's full name
    public let author: String

    /// Cover's hex color
    public let coverColor: String

    /// True if book has been bookmarked
    public var isBookmark = false
}
