//
//  NewsServiceImplementation.swift
//  verse-swiftui-examples
//
//  Created by incetro on 11/13/21.
//

import Combine
import Foundation

// MARK: - NewsServiceImplementation

public final class NewsServiceImplementation {

}

// MARK: - NewsService

extension NewsServiceImplementation: NewsService {

    public func refresh(newsID: Int, isThumbUp: Bool) -> AnyPublisher<Bool, Error> {
        Future { completion in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if arc4random() % 100 > 25 {
                    completion(.success(isThumbUp))
                } else {
                    let error = NSError(
                        domain: "com.incetro.news-service",
                        code: 1304,
                        userInfo: [
                            NSLocalizedDescriptionKey: "Something went wrong during news rating"
                        ]
                    )
                    completion(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
}
