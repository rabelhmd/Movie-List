//
//  MovieListView.swift
//  Movies
//
//  Created by Rabel Ahmed  on 21/9/22.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel: MovieListViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(viewModel.listData) { movieItem in
                MovieListCellView(model: movieItem)
            }
        }
    }
}
