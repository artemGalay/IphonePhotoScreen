//
//  MainTabBarController.swift
//  IphonePhotoScreen
//
//  Created by Артем Галай on 3.09.22.
//

import UIKit

class MainTabBarController: UITabBarController {

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

        let mediaLibraryVC = MediaLibraryViewController()
        let forYouVC = ForYouViewController()
        let albumsVC = UINavigationController(rootViewController: AlbumsViewController())
        let searchVC = SearchViewController()

        self.setViewControllers([mediaLibraryVC, forYouVC, albumsVC, searchVC], animated: true)

        guard let items = tabBar.items else { return }

        items[0].title = "Медиатека"
        items[1].title = "Для Вас"
        items[2].title = "Альбомы"
        items[3].title = "Поиск"

        items[0].image = UIImage(systemName: "photo.fill.on.rectangle.fill")
        items[1].image = UIImage(systemName: "heart.text.square.fill")
        items[2].image = UIImage(systemName: "square.stack.fill")
        items[3].image = UIImage(systemName: "magnifyingglass")

        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont(name: "Arial", size: 13) as Any],
                                                         for: .normal)
    }
}
