//
//  AvatarImage.swift
//  MHA_Companion
//
//  Created by Wiemer on 9/7/21.
//

import Combine
import SwiftUI

struct AvatarImage: View {
    @StateObject private var imageLoader: ImageLoader
    private let imageUrl: String?

    init(imageUrl: String?, imageLoader: ImageLoader = ImageLoader()) {
        _imageLoader = StateObject(wrappedValue: imageLoader)
        self.imageUrl = imageUrl
    }

    var body: some View {
        ZStack {
            if imageLoader.isLoading {
                ProgressView()
                    .frame(width: Constants.imageSize, height: Constants.imageSize)
            } else if let data = imageLoader.data,
                      let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: Constants.imageSize, height: Constants.imageSize)
                    .cornerRadius(Constants.cornerRadius)
            } else {
                Image(systemName: Strings.placeholderAvatar)
                    .resizable()
                    .frame(width: Constants.imageSize, height: Constants.imageSize)
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
        AvatarImage(imageUrl: nil)
    }
}
