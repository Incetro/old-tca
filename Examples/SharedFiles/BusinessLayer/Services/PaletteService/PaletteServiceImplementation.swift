//
//  PaletteServiceImplementation.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import Combine
import Foundation

// MARK: - PaletteServiceImplementation

public final class PaletteServiceImplementation {

}

// MARK: - PaletteService

extension PaletteServiceImplementation: PaletteService {

    public func refresh(paletteID: String, isFavorite: Bool) -> AnyPublisher<Bool, Error> {
        Future { completion in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if arc4random() % 100 > 25 {
                    completion(.success(isFavorite))
                } else {
                    let error = NSError(
                        domain: "com.incetro.palette-service",
                        code: 1301,
                        userInfo: [
                            NSLocalizedDescriptionKey: "Something went wrong during palette favoriting"
                        ]
                    )
                    completion(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
}
