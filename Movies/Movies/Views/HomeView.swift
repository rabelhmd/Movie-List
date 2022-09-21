//
//  HomeView.swift
//  Movies
//
//  Created by Rabel Ahmed  on 21/9/22.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            Color.red
                .navigationBarTitle(Text("Movie List"), displayMode: .automatic)
                .navigationBarHidden(false)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
