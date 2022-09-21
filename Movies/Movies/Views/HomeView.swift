//
//  HomeView.swift
//  Movies
//
//  Created by Rabel Ahmed  on 21/9/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var homeVM = HomeViewModel()
    @StateObject private var movieListVM = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            MovieListView(viewModel: movieListVM)
                .vTop()
                .navigationBarTitle(Text(homeVM.title), displayMode: .automatic)
                .navigationBarHidden(false)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .searchable(text: $homeVM.searchText)
        .onSubmit(of: .search) {
            movieListVM.fetch(query: homeVM.searchText)
        }
        .onChange(of: homeVM.searchText, perform: { newValue in
            if homeVM.onPressedCancel {
                movieListVM.fetch()
            }
        })
        .onAppear {
            movieListVM.fetch()
        }
    }
}

