//
//  FavoriteCompositionState.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import TCA
import Foundation

// MARK: - FavoriteCompositionState

/// `FavoriteComposition` module state
///
/// Basically, `FavoriteCompositionState` is a type that describes the data
/// `FavoriteComposition` feature needs to perform its logic and render its UI.
public struct FavoriteCompositionState: Equatable {

    // MARK: - Properties

    /// Palettes favoritable components
    public var palettes: IdentifiedArrayOf<PaletteState> = []

    /// Users favoritable components
    public var users: IdentifiedArrayOf<UserState> = []

    /// Books favoritable components
    public var books: IdentifiedArrayOf<BookState> = []

    /// News favoritable components
    public var news: IdentifiedArrayOf<NewsState> = []
}

// MARK: - Default

extension FavoriteCompositionState {

    static var `default`: FavoriteCompositionState {
        .init(
            palettes: .init(
                [
                    PaletteState(palette: Palette(colors: ["e63946", "f1faee", "a8dadc", "457b9d", "1d3557"])),
                    PaletteState(palette: Palette(colors: ["780000", "c1121f", "fdf0d5", "003049", "669bbc"])),
                    PaletteState(palette: Palette(colors: ["3d5a80", "98c1d9", "e0fbfc", "ee6c4d", "293241"])),
                    PaletteState(palette: Palette(colors: ["2b2d42", "8d99ae", "edf2f4", "ef233c", "d90429"])),
                    PaletteState(palette: Palette(colors: ["463f3a", "8a817c", "bcb8b1", "f4f3ee", "e0afa0"]))
                ]
            ),
            users: .init(
                [
                    UserState(
                        user: User(
                            id: 1,
                            name: "Mike Ross",
                            username: "clevermoon",
                            avatarURL: .init(string: "https://picsum.photos/id/447/200/200").unsafelyUnwrapped
                        )
                    ),
                    UserState(
                        user: User(
                            id: 2,
                            name: "Rachel Zane",
                            username: "garrylove",
                            avatarURL: .init(string: "https://picsum.photos/id/1011/200/200").unsafelyUnwrapped
                        )
                    ),
                    UserState(
                        user: User(
                            id: 3,
                            name: "Harvey Specter",
                            username: "suitman",
                            avatarURL: .init(string: "https://picsum.photos/id/1005/200/200").unsafelyUnwrapped
                        )
                    )
                ]
            ),
            books: .init(
                [
                    BookState(book: Book(name: "Steve Jobs", author: "Walter Isaacson", coverColor: "3a86ff")),
                    BookState(book: Book(name: "Enrique's Journey", author: "Sonia Nazario", coverColor: "fb5607")),
                    BookState(book: Book(name: "A Beautiful Mind", author: "Sylvia Nasar", coverColor: "38b000"))
                ]
            ),
            news: .init(
                [
                    NewsState(
                        news: .init(
                            id: 1,
                            publisherName: "The New Boom Times",
                            publisherAvatarURL: .init(string: "https://picsum.photos/id/430/200/200").unsafelyUnwrapped,
                            text: """
                            Two weeks of high-profile talks yielded a package that pushes countries to\
                            strengthen near-term climate targets and move away from fossil fuels faster.
                            It insists that wealthy countries fulfill a broken promise to help vulnerable\
                            nations cope with the rising costs of climate change. And it cracks open the door\
                            to future payments developed nations might make for damage already done.
                            """,
                            thumbsCount: 13,
                            date: "now"
                        )
                    ),
                    NewsState(
                        news: .init(
                            id: 2,
                            publisherName: "Everyday Health",
                            publisherAvatarURL: .init(string: "https://picsum.photos/id/486/200/200").unsafelyUnwrapped,
                            text: """
                            Between the upcoming flu season, seasonal allergies, and the ongoing COVID-19 pandemic,\
                            there are lots of reasons to give your immune system a boost. For that big job, more people\
                            are turning to a tiny resource.

                            Probiotics are living microorganisms, and you already have some of them in your body.\
                            Others come from food, specifically fermented foods such as yogurt, according to the National Center\
                            for Complementary and Integrative Health (NCCIH).

                            Probiotics are sometimes called good bacteria: They can help your body digest food and even fight\
                            cells that cause disease. Probiotics have shown promise in helping ease diarrhea, ulcerative colitis,\
                            and periodontal disease, according to the NCCIH. Research about other benefits of these beneficial bacteria\
                            is ongoing, and one area of particular interest is how they impact immunity.
                            """,
                            thumbsCount: 714,
                            date: "39 minutes ago"
                        )
                    ),
                    NewsState(
                        news: .init(
                            id: 3,
                            publisherName: "The Washington Post",
                            publisherAvatarURL: .init(string: "https://picsum.photos/id/534/200/200").unsafelyUnwrapped,
                            text: """
                            Sarah Silikula’s son got into the car after school one day last month, upset and confused\
                            by what his teacher had just taught him. Armed with new knowledge, the eighth-grader had an\
                            announcement and a revisionist history lesson for his mother.
                            “I’m never getting vaccinated. I’m never getting any more shots of any kind. Did you know Trump’s\
                            still president?” Silikula remembered him saying.
                            """,
                            thumbsCount: 219,
                            date: "11 Nov 2021"
                        )
                    )
                ]
            )
        )
    }
}
