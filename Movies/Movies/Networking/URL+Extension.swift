//
//  URL+Extension.swift
//  Movies
//
//  Created by Rabel Ahmed  on 21/9/22.
//

import SwiftUI

extension URL {
    static let baseServerURL = "https://api.themoviedb.org"
    static let api_key = "096206e7c3ced76d12c875f8b67ac6db"
    static let api_version = "3"
    static let imageBase = "https://image.tmdb.org/t/p/original"
    
    static func searchMovies(_ query: String) -> URL? {
        URL(string: baseServerURL + "/\(api_version)/search/movie?api_key=\(api_key)&query=\(query.lowercased())")
    }
    
    static func poster(_ path: String) -> URL? {
        URL(string: imageBase + "/" + path)
    }
}
