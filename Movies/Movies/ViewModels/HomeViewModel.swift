//
//  HomeViewModel.swift
//  Movies
//
//  Created by Rabel Ahmed  on 22/9/22.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var searchText = ""
    @Environment(\.isSearching) var isSearching: Bool
    let title: String = "Movie List"
    
    var onPressedCancel: Bool {
        searchText.isEmpty && !isSearching
    }
}
