//
//  ImageServiceImplementation.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import Combine
import Foundation
import UIKit

// MARK: - ImageServiceImplementation

public final class ImageServiceImplementation {

    // MARK: - Properties

    /// URLSession instance
    private let session: URLSession

    // MARK: - Initializers

    init(session: URLSession) {
        self.session = session
    }
}

// MARK: - ImageService

extension ImageServiceImplementation: ImageService {

    public func download(imageURL: URL) -> AnyPublisher<UIImage?, Error> {
        session
            .dataTaskPublisher(for: imageURL)
            .map { UIImage(data: $0.data) }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
