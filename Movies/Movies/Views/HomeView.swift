//
//  HomeView.swift
//  Movies
//
//  Created by Rabel Ahmed  on 21/9/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var homeVM = HomeViewModel()
    
    var body: some View {
        NavigationView {
            Color.red
                .navigationBarTitle(Text("Movie List"), displayMode: .automatic)
                .navigationBarHidden(false)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .searchable(text: $homeVM.searchText)
        .onSubmit(of: .search) {
            
        }
    }
}
