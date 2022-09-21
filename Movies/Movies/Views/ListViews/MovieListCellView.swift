//
//  MovieListCellView.swift
//  Movies
//
//  Created by Rabel Ahmed  on 21/9/22.
//

import SwiftUI

struct MovieListCellView: View {
    let model: MovieSchemaResult
    
    var body: some View {
        VStack {
            dividerView()
            dataContainerView()
        }
    }
}

extension MovieListCellView {
    @ViewBuilder private func dividerView() -> some View {
        Color.black
            .frame(height: 0.5)
            .padding(.horizontal)
    }
    
    @ViewBuilder private func posterView() -> some View {
        VStack {
            if let url = URL.poster(model.posterPath) {
                loadImageWith(url: url)
            } else {
                Image(Resources.icon.imageLoadingFailed)
                    .resizable()
                    .scaledToFit()
                    .vCenter()
                    .hCenter()
            }
        }
    }
    
    @ViewBuilder private func dataContainerView() -> some View {
        HStack {
            posterView()
            .frame(width: 100, height: 150)
            .padding()
            VStack {
                titleView()
                    .hLeading()
                    .padding([.vertical, .trailing], 6)
                descriptionView()
                    .padding(.trailing, 6)
                    .hLeading()
            }
            .vTop()
        }
    }
    
    @ViewBuilder private func loadImageWith(url: URL) -> some View {
        RemoteImageView(url: url) {
            GIFImage(name: "spinner")
                .vCenter()
                .hCenter()
        } image: {
            $0.resizable()
                .scaledToFit()
                .vCenter()
                .hCenter()
        }
    }
    
    @ViewBuilder private func titleView() -> some View {
        Text(model.title)
            .font(.title2)
            .fontWeight(.bold)
    }
    
    @ViewBuilder private func descriptionView() -> some View {
        Text(model.overview)
    }
}
