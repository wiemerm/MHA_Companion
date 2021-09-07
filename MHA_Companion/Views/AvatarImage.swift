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

    init(character: Character, imageLoader: ImageLoader = ImageLoader()) {
        _imageLoader = StateObject(wrappedValue: imageLoader)
        imageUrl = character.images.first(where: { $0.contains("\(character.id).jpg") })
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
        AvatarImage(character: Character(id: "",
                                         name: nil,
                                         alias: nil,
                                         affiliation: nil,
                                         birthday: nil,
                                         bloodtype: nil,
                                         description: nil,
                                         fightstyle: nil,
                                         gender: nil,
                                         eye: nil,
                                         hair: nil,
                                         kanji: nil,
                                         occupation: nil,
                                         quirk: nil,
                                         romaji: nil,
                                         status: nil,
                                         teams: nil,
                                         images: [],
                                         epithet: nil,
                                         ages: nil,
                                         family: nil))
    }
}
