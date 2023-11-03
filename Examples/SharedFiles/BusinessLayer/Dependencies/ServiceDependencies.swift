//
//  DependencyValues.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 18.04.2023.
//

import OldTCA
import Foundation

// MARK: - DependencyValues

extension DependencyValues {
    
    // MARK: - PaletteService
    
    /// The current `PaletteService` service  that features should use when handling service interactions.
    public var paletteService: PaletteService {
        get { self[PaletteServiceKey.self] }
        set { self[PaletteServiceKey.self] = newValue }
    }
    
    // MARK: - DependencyKey
    
    /// Dependecy key for `PaletteServiceKey` instance
    private enum PaletteServiceKey: DependencyKey {
        static let liveValue: PaletteService = PaletteServiceImplementation()
    }
    
    // MARK: - ImageService
    
    /// The current `ImageService` service  that features should use when handling service interactions.
    public var imageService: ImageService {
        get { self[ImageServiceKey.self] }
        set { self[ImageServiceKey.self] = newValue }
    }
    
    // MARK: - DependencyKey
    
    /// Dependecy key for `PaletteServiceKey` instance
    private enum ImageServiceKey: DependencyKey {
        static let liveValue: ImageService = ImageServiceImplementation(session: Dependency(\.urlSession).wrappedValue)
    }
    
    // MARK: - BookService
    
    /// The current `BookService` service  that features should use when handling service interactions.
    public var bookService: BookService {
        get { self[BookServiceKey.self] }
        set { self[BookServiceKey.self] = newValue }
    }
    
    // MARK: - DependencyKey
    
    /// Dependecy key for `BookServiceKey` instance
    private enum BookServiceKey: DependencyKey {
        static let liveValue: BookService = BookServiceImplementation()
    }
    
    // MARK: - ScrambleService
    
    /// The current `ScrambleService` service  that features should use when handling service interactions.
    public var scrambleService: ScrambleService {
        get { self[ScrambleServiceKey.self] }
        set { self[ScrambleServiceKey.self] = newValue }
    }
    
    // MARK: - DependencyKey
    
    /// Dependecy key for `ScrambleServiceKey` instance
    private enum ScrambleServiceKey: DependencyKey {
        static let liveValue: ScrambleService = ScrambleServiceImplementation()
    }
    
    // MARK: - UserService
    
    /// The current `UserService` service  that features should use when handling service interactions.
    public var userService: UserService {
        get { self[UserServiceKey.self] }
        set { self[UserServiceKey.self] = newValue }
    }
    
    // MARK: - DependencyKey
    
    /// Dependecy key for `UserServiceKey` instance
    private enum UserServiceKey: DependencyKey {
        static let liveValue: UserService = UserServiceImplementation()
    }
    
    // MARK: - NewsService
    
    /// The current `NewsService` service  that features should use when handling service interactions.
    public var newsService: NewsService {
        get { self[NewsServiceKey.self] }
        set { self[NewsServiceKey.self] = newValue }
    }
    
    // MARK: - DependencyKey
    
    /// Dependecy key for `NewsServiceKey` instance
    private enum NewsServiceKey: DependencyKey {
        static let liveValue: NewsService = NewsServiceImplementation()
    }
    
    // MARK: - NumberFactService
    
    /// The current `NumberFactService` service  that features should use when handling service interactions.
    public var numberFactService: NumberFactService {
        get { self[NumberFactServiceKey.self] }
        set { self[NumberFactServiceKey.self] = newValue }
    }
    
    // MARK: - DependencyKey
    
    /// Dependecy key for `NumberFactServiceKey` instance
    private enum NumberFactServiceKey: DependencyKey {
        static let liveValue: NumberFactService = NumberFactServiceImplementation(session: .shared)
    }
}
