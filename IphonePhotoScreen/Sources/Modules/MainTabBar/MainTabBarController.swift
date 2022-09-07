//
//  MainTabBarController.swift
//  IphonePhotoScreen
//
//  Created by Артем Галай on 3.09.22.
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupTabBarViewControllers()
    }

    private func  setupTabBar() {
        tabBar.backgroundColor = .tertiarySystemFill
        tabBar.tintColor = .systemBlue
    }
    private func setupTabBarViewControllers() {

        let mediaLibrary = UINavigationController(rootViewController: MediaLibraryViewController())
        let forYou = UINavigationController(rootViewController: ForYouViewController())
        let albums = UINavigationController(rootViewController: AlbumsViewController())
        let search = UINavigationController(rootViewController: SearchViewController())

        self.setViewControllers([mediaLibrary, forYou, albums, search], animated: true)

        mediaLibrary.title = "Медиатека"
        forYou.title = "Для Вас"
        albums.title = "Альбомы"
        search.title = "Поиск"

        mediaLibrary.tabBarItem.image = UIImage(systemName: "photo.fill.on.rectangle.fill")
        forYou.tabBarItem.image = UIImage(systemName: "heart.text.square.fill")
        albums.tabBarItem.image = UIImage(systemName: "square.stack.fill")
        search.tabBarItem.image = UIImage(systemName: "magnifyingglass")

        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont(name: "Arial", size: 13) as Any],
                                                         for: .normal)
    }
}
