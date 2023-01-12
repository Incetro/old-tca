//
//  BookServiceImplementation.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import Combine
import Foundation

// MARK: - BookServiceImplementation

public final class BookServiceImplementation {

}

// MARK: - BookService

extension BookServiceImplementation: BookService {

    public func refresh(bookID: String, isBookmark: Bool) -> AnyPublisher<Bool, Error> {
        Future { completion in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if arc4random() % 100 > 25 {
                    completion(.success(isBookmark))
                } else {
                    let error = NSError(
                        domain: "com.incetro.book-service",
                        code: 1303,
                        userInfo: [
                            NSLocalizedDescriptionKey: "Something went wrong during bookmarking"
                        ]
                    )
                    completion(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
}
