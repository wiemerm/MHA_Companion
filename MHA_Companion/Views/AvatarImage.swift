//
//  AvatarImage.swift
//  MHA_Companion
//
//  Created by Wiemer on 9/7/21.
//

import Combine
import SwiftUI

struct AvatarImage: View {
    let size: CGSize
    @StateObject private var imageLoader: ImageLoader
    private let imageUrl: String?

    init(imageUrl: String?, size: CGSize = CGSize(width: 75, height: 75), imageLoader: ImageLoader = ImageLoader()) {
        _imageLoader = StateObject(wrappedValue: imageLoader)
        self.imageUrl = imageUrl
        self.size = size
    }

    var body: some View {
        ZStack {
            if imageLoader.isLoading {
                ProgressView()
                    .frame(width: size.width, height: size.height)
            } else if let data = imageLoader.data,
                      let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: size.width, height: size.height)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(Constants.cornerRadius)
            } else {
                Image("no_image")
                    .resizable()
                    .frame(width: size.width, height: size.height)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(Constants.cornerRadius)
                    .accessibility(identifier: "placeholder avatar")
            }
        }.onAppear(perform: {
            loadImage()
        })
    }

    func loadImage() {
        imageLoader.loadImage(from: imageUrl)
    }
}

struct AvatarImage_Previews: PreviewProvider {
    static var previews: some View {
        AvatarImage(imageUrl: nil, size: CGSize(width: 125, height: 125))
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12 Pro")
    }
}
