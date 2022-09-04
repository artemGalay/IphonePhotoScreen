//
//  MainTabBarController.swift
//  IphonePhotoScreen
//
//  Created by Артем Галай on 3.09.22.
//

import UIKit

//import UIKit
//
//class TabBarController: UITabBarController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setupTabBarController()
//        setupTabBarViewControllers()
//    }
//
//    func setupTabBarController() {
//        tabBar.tintColor = .systemBlue
//        tabBar.backgroundColor = .white
//    }
//
//    func setupTabBarViewControllers() {
//
//        let first = UINavigationController(rootViewController: MediaLibraryViewController())
//        first.tabBarItem = UITabBarItem(title: "Медиатека", image: UIImage(systemName: "photo.fill.on.rectangle.fill"),
//                                        selectedImage: UIImage(systemName: "photo.fill.on.rectangle.fill"))
//
//        let two = UINavigationController(rootViewController: ForYouViewController())
//        two.tabBarItem = UITabBarItem(title: "Для Вас",
//                                      image: UIImage(systemName: "heart.text.square.fill"),
//                                      selectedImage: UIImage(systemName: "heart.text.square.fill"))
//
//        let third = UINavigationController(rootViewController: AlbumsViewController())
//        third.tabBarItem = UITabBarItem(title: "Альбомы", image: UIImage(systemName: "rectangle.stack.fill"),
//                                     selectedImage: UIImage(systemName: "rectangle.stack.fill"))
//
//        let fourth = UINavigationController(rootViewController: SearchViewController())
//        fourth.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"),
//                                      selectedImage: UIImage(systemName: "magnifyingglass"))
//
//        let controllers = [first, two, third, fourth]
//        self.setViewControllers(controllers, animated: true)
//    }
//}

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
        let albumcVC = UINavigationController(rootViewController: AlbumsViewController())
        let searchVC = SearchViewController()

        self.setViewControllers([mediaLibraryVC, forYouVC, albumcVC, searchVC], animated: true)

        guard let items = tabBar.items else { return }

        items[0].title = "Медиатека"
        items[1].title = "Для Вас"
        items[2].title = "Альбомы"
        items[3].title = "Поиск"

        items[0].image = UIImage(systemName: "photo.fill.on.rectangle.fill")
        items[1].image = UIImage(systemName: "heart.text.square.fill")
        items[2].image = UIImage(systemName: "square.stack.fill")
        items[3].image = UIImage(systemName: "magnifyingglass")

//        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont(name: "Arial", size: 13) as Any],
//                                                         for: .normal)
    }
}
