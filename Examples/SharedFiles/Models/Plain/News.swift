//
//  News.swift
//  verse-swiftui-examples
//
//  Created by incetro on 11/14/21.
//

import Foundation

// MARK: - News

public struct News: Equatable {

    // MARK: - Properties

    /// Unique identifier
    public let id: Int

    /// Publisher's name
    public let publisherName: String

    /// Publisher's avatar
    public let publisherAvatarURL: URL

    /// News text
    public let text: String

    /// Thumbs count value
    public var thumbsCount: Int

    /// Publication date
    public let date: String

    /// True if record has been thumbed up
    public var isThumbUp = false
}
