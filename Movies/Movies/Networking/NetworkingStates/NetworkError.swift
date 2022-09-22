//
//  MoviesApp.swift
//  Movies
//
//  Created by Rabel Ahmed  on 21/9/22.
//

import SwiftUI

enum NetworkError: Error {
    case badUrl
    case noData
    case decodingError
    case transportError
    case serverError
    case badToken
    
    var description: String {
        switch self {
        case .badUrl: return "Bad URL!!!"
        case .noData: return "🙁 No Data Found!!!"
        case .decodingError: return "Decoding Error!!!"
        case .transportError: return "Transport Error!!!"
        case .serverError: return "Server Error!!!"
        case .badToken: return "Bad Token Error"
        }
    }
}

extension NetworkError {
    
    init?(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            self = .transportError
            return
        }

        if let response = response as? HTTPURLResponse {
            if response.statusCode == 401 {
                self = .badToken
                return
            }
            else if !(200...299).contains(response.statusCode) {
                self = .serverError
                return
            }
        }
        
        if data == nil {
            self = .noData
        }
        
        return nil
    }
}

