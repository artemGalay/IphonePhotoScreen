//
//  SceneDelegate.swift
//  IphonePhotoScreen
//
//  Created by Артем Галай on 2.09.22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewController = MainTabBarController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}

