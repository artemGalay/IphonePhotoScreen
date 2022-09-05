//
//  File.swift
//  IphonePhotoScreen
//
//  Created by Артем Галай on 4.09.22.
//

import Foundation

struct AlbumsModel: Hashable {
    var image: String
    var description: String
    var number: String
}

extension AlbumsModel {
    static let modelsArray = [
        [AlbumsModel(image: "недавние", description: "Недавние", number: "4777"),
         AlbumsModel(image: "избранное", description: "Избранное", number: "8"),
         AlbumsModel(image: "insta", description: "Instagram", number: "34"),
         AlbumsModel(image: "whatsapp", description: "WhatsApp", number: "63"),
         AlbumsModel(image: "telegram", description: "Telegram", number: "79"),
         AlbumsModel(image: "aliexpress", description: "Aliexpress", number: "13"),
         AlbumsModel(image: "faceapp", description: "FaceApp", number: "5"),
         AlbumsModel(image: "movavi", description: "Movavi Clips", number: "187")
        ],
        [AlbumsModel(image: "люди", description: "Люди", number: "10"),
         AlbumsModel(image: "места", description: "Места", number: "2403")
        ]
    ]
}
