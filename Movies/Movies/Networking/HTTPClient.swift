//
//  MoviesApp.swift
//  Movies
//
//  Created by Rabel Ahmed  on 21/9/22.
//

import SwiftUI

class HTTPClient {
    
    func fetchData<T: Decodable>(urlRequest: URLRequest, completion: @escaping(Result<T?, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let networkError = NetworkError(data: data, response: response, error: error) {
                return completion(.failure(networkError))
            }
            guard let decodedData = try? JSONDecoder().decode(T.self, from: data!) else {
                return completion(.failure(.decodingError))
            }
            completion(.success(decodedData))
        }.resume()
    }
    
    func getMovies(query: String = "marvel", completion: @escaping(Result<MovieSchema?, NetworkError>) -> Void) {
        guard let url = URL.searchMovies(query) else {
            return completion(.failure(.badUrl))
        }
        let urlRequest = URLRequest(url: url)
        fetchData(urlRequest: urlRequest, completion: completion)
    }
}

