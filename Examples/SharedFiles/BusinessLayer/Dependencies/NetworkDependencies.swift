//
//  NetworkDependencies.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 18.04.2023.
//

import OldTCA
import Foundation

// MARK: - DependencyValues

extension DependencyValues {
    
    // MARK: - URLSession
    
    /// The current `URLSession` service  that features should use when handling service interactions.
    public var urlSession: URLSession {
        get { self[URLSessionKey.self] }
        set { self[URLSessionKey.self] = newValue }
    }
    
    // MARK: - DependencyKey
    
    /// Dependecy key for `URLSessionKey` instance
    private enum URLSessionKey: DependencyKey {
        static let liveValue: URLSession = .shared
    }
}
