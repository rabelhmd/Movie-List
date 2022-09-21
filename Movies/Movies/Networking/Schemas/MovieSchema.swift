//
//  MovieSchema.swift
//  Movies
//
//  Created by Rabel Ahmed  on 21/9/22.
//

import SwiftUI

struct MovieSchema: Codable {
    let page: Int
    let movieSchemaResults: [MovieSchemaResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case movieSchemaResults = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Results
struct MovieSchemaResult: Codable, Hashable, Identifiable {
    let id: Int
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let originalLanguage: String?
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id, adult, overview, popularity, title, video
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

