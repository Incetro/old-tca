//
//  ImageService.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import Combine
import Foundation
import UIKit

// MARK: - ImageService

public protocol ImageService {

    /// Download an image from the given URL
    func download(imageURL: URL) -> AnyPublisher<UIImage?, Error>
}

// MARK: - DownloadImageError

/// A wrapper for errors that occur when favoriting
public struct DownloadImageError: Equatable, Error, Identifiable {

    // MARK: - Properties

    /// Occurred error
    public let error: NSError

    /// Error description
    public var localizedDescription: String {
        error.localizedDescription
    }

    /// Error unique id
    public var id: String {
        error.localizedDescription
    }

    /// Comparator
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
