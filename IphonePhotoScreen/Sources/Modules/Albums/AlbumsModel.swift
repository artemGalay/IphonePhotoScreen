//
//  AlbumsModel.swift
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
        [AlbumsModel(image: "recent", description: "Недавние", number: "4777"),
         AlbumsModel(image: "favourites", description: "Избранное", number: "8"),
         AlbumsModel(image: "insta", description: "Instagram", number: "34"),
         AlbumsModel(image: "whatsapp", description: "WhatsApp", number: "63"),
         AlbumsModel(image: "telegram", description: "Telegram", number: "79"),
         AlbumsModel(image: "aliexpress", description: "Aliexpress", number: "13"),
         AlbumsModel(image: "faceapp", description: "FaceApp", number: "5"),
         AlbumsModel(image: "movavi", description: "Movavi Clips", number: "187")
        ],
        [AlbumsModel(image: "people", description: "Люди", number: "10"),
         AlbumsModel(image: "places", description: "Места", number: "2403")
        ],
        [AlbumsModel(image: "video", description: "Видео", number: "1012"),
         AlbumsModel(image: "person.crop.square", description: "Селфи", number: "94"),
         AlbumsModel(image: "livephoto", description: "Фото Live Photos", number: "219"),
         AlbumsModel(image: "cube", description: "Портреты", number: "550"),
         AlbumsModel(image: "pano", description: "Панорамы", number: "2"),
         AlbumsModel(image: "slowmo", description: "Замедленно", number: "3"),
         AlbumsModel(image: "video.square", description: "Киноэффект", number: "8"),
         AlbumsModel(image: "camera.viewfinder", description: "Снимки экрана", number: "539"),
         AlbumsModel(image: "record.circle", description: "Записи экрана", number: "28"),
         AlbumsModel(image: "r.square.on.square", description: "RAW", number: "3")
        ],
        [AlbumsModel(image: "square.and.arrow.down", description: "Импортированные", number: "258"),
         AlbumsModel(image: "eye.slash", description: "Скрытые", number: "0"),
         AlbumsModel(image: "trash", description: "Недавно удаленные", number: "0")
        ]
    ]
}
