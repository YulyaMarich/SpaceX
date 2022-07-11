//
//  SceneDelegate.swift
//  SpaceX
//
//  Created by Julia on 06.07.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
               window?.windowScene = windowScene
               window?.rootViewController = MainTabBarController()
               window?.makeKeyAndVisible()
    }
}

