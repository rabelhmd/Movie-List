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
    @Published var loadingTitle = "Loading..."
    private let httpClient = HTTPClient()
    @Published var errorText: String = "Error!!!"
    
    var hideProgressView: Bool {
        loadingState != .loading
    }
    
    var hideMovieListView: Bool {
        loadingState != .success
    }
    
    var hideErrorView: Bool {
        switch loadingState {
        case .none: return true
        case .loading, .success: return true
        case .failed: return false
        }
    }
    
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
                Thread.delay(bySeconds: 0.0) {
                    self.onFailedSchemaLoad(error)
                }
            }
        }
    }
    
    private func onDataLoaded(_ movieSchema: MovieSchema?) {
        self.listData = movieSchema?.movieSchemaResults ?? []
        if listData.isEmpty {
            onFailedSchemaLoad(.noData)
        } else {
            updateLoadingState(.success)
        }
    }
    
    private func onFailedSchemaLoad(_ error: NetworkError) {
        updateLoadingState(.failed)
        updateErrorText(error)
    }
    
    private func updateLoadingState(_ loadingState: LoadingState) {
        Thread.delay(bySeconds: 0.0) {
            self.loadingState = loadingState
            self.updateLoadingTitle(loadingState)
        }
    }
    
    private func updateLoadingTitle(_ loadingState: LoadingState) {
        self.loadingTitle = loadingState.description
    }
    
    private func updateErrorText(_ error: NetworkError) {
        self.errorText = error.description
    }
}
