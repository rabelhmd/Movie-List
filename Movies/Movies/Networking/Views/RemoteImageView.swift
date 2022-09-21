//
//  MoviesApp.swift
//  Movies
//
//  Created by Rabel Ahmed  on 21/9/22.
//

import SwiftUI

struct RemoteImageView<Placeholder: View, ConfiguredImage: View>: View {
    var url: URL
    private let placeholder: () -> Placeholder
    private let image: (Image) -> ConfiguredImage

    @StateObject var imageLoader = ImageLoaderService()
    @State var imageData: UIImage?

    init(
        url: URL,
        @ViewBuilder placeholder: @escaping () -> Placeholder,
        @ViewBuilder image: @escaping (Image) -> ConfiguredImage
    ) {
        self.url = url
        self.placeholder = placeholder
        self.image = image
    }

    @ViewBuilder private var imageContent: some View {
        if let data = imageData {
            image(Image(uiImage: data))
        } else {
            placeholder()
        }
    }

    var body: some View {
        imageContent
            .onReceive(imageLoader.$image.dropFirst()) { imageData in
                self.imageData = imageData
            }
            .onAppear {
                self.imageLoader.loadImage(for: url)
            }
    }
}

class ImageLoaderService: ObservableObject {
    @Published var image = UIImage()
    
    func loadImage(for url: URL) {
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
    }
}
