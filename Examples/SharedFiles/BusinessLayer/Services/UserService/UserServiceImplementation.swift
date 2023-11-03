//
//  UserServiceImplementation.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import Combine
import Foundation

// MARK: - UserServiceImplementation

public final class UserServiceImplementation {

}

// MARK: - UserService

extension UserServiceImplementation: UserService {

    public func refresh(userID: Int, isStarred: Bool) -> AnyPublisher<Bool, Error> {
        Future { completion in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if arc4random() % 100 > 25 {
                    completion(.success(isStarred))
                } else {
                    let error = NSError(
                        domain: "com.incetro.user-service",
                        code: 1302,
                        userInfo: [
                            NSLocalizedDescriptionKey: "Something went wrong during user favoriting"
                        ]
                    )
                    completion(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
}
