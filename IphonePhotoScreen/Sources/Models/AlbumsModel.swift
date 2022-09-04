//
//  File.swift
//  IphonePhotoScreen
//
//  Created by Артем Галай on 4.09.22.
//

import Foundation

struct AlbumsModel: Hashable {
    var image: String
    var descriptionLabel: String
    var numberLabel: String
}

extension AlbumsModel {
    static let modelsArray = [
        [AlbumsModel(image: "недавние", descriptionLabel: "Недавние", numberLabel: "4777"),
         AlbumsModel(image: "insta", descriptionLabel: "Instagram", numberLabel: "34"),
         AlbumsModel(image: "избранное", descriptionLabel: "Избранное", numberLabel: "8"),
         AlbumsModel(image: "whatsapp", descriptionLabel: "WhatsApp", numberLabel: "63"),
         AlbumsModel(image: "telegram", descriptionLabel: "Telegram", numberLabel: "79"),
         AlbumsModel(image: "faceapp", descriptionLabel: "FaceApp", numberLabel: "5"),
         AlbumsModel(image: "aliexpress", descriptionLabel: "Aliexpress", numberLabel: "13"),
         AlbumsModel(image: "movavi", descriptionLabel: "Movavi Clips", numberLabel: "187")
        ]
    ]
}
