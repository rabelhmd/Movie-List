//
//  LoadingProgressView.swift
//  Movies
//
//  Created by Rabel Ahmed  on 22/9/22.
//

import SwiftUI

struct LoadingProgressView: View {
    let title: String
    
    var body: some View {
        ZStack {
            Color(.white)
                .opacity(0.3)
                .ignoresSafeArea()
            ProgressView(title)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemBackground))
                )
                .shadow(radius: 10)
        }
    }
}
