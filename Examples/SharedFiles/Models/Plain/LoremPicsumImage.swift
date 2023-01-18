//
//  LoremPicsumImage.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import Foundation

// MARK: - LoremPicsumImage

public struct LoremPicsumImage: Equatable {

    // MARK: - Properties

    /// Unique identifier
    public let id = UUID()
    
    /// Image url address
    public let url: URL

    /// Image title
    public let title: String
}
