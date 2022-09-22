//
//  MoviesApp.swift
//  Movies
//
//  Created by Rabel Ahmed  on 21/9/22.
//

import SwiftUI

enum LoadingState {
    case loading
    case success
    case failed
    case none
    
    var description: String {
        switch self {
        case .none: return "None"
        case .failed: return "Failed."
        case .success: return "Success."
        case .loading: return "Loading..."
        }
    }
}
