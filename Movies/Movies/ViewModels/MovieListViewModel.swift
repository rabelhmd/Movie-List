//
//  MovieListViewModel.swift
//  Movies
//
//  Created by Rabel Ahmed  on 21/9/22.
//

import SwiftUI

class MovieListViewModel: ObservableObject {
    private let TAG = String(describing: MovieListViewModel.self) + ": "
    
    @Published var listData = [MovieSchemaResult]()
    @Published var loadingState = LoadingState.none
    private let httpClient = HTTPClient()
    var loadingError: NetworkError?
    
    deinit {
        printIfDebug(TAG + "\(#function)")
        release()
    }
    
    init() {
        printIfDebug(TAG + "\(#function)")
    }
    
    func release() {
        printIfDebug(TAG + "\(#function)")
        loadingState = .none
        loadingError = nil
        listData = []
    }
    
    func fetch(query: String = "marvel") {
        printIfDebug(TAG + "\(#function)")
        
        updateLoadingState(.loading)
        httpClient.getMovies(query: query) { result in
            switch result {
            case .success(let movieSchema):
                Thread.delay(bySeconds: 0.0) {
                    self.onDataLoaded(movieSchema)
                }
            case .failure(let error):
                print(error)
                Thread.delay(bySeconds: 0.5) {
                    self.onFailedSchemaLoad(error)
                }
            }
        }
    }
    
    private func updateLoadingState(_ loadingState: LoadingState) {
        Thread.delay(bySeconds: 0.0) {
            self.loadingState = loadingState
        }
    }
    
    private func onDataLoaded(_ movieSchema: MovieSchema?) {
        self.listData = movieSchema?.movieSchemaResults ?? []
        updateLoadingState(.success)
    }
    
    private func onFailedSchemaLoad(_ error: NetworkError) {
        loadingError = error
        updateLoadingState(.failed)
    }
}
