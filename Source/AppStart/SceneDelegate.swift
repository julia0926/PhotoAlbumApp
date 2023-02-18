//
//  SceneDelegate.swift
//  PhotoAlbumApp
//
//  Created by Julia on 2023/02/18.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        let feedViewController = AlbumViewController()
        feedViewController.view.backgroundColor = .systemBackground
        window.rootViewController = feedViewController
        window.makeKeyAndVisible()
    }

}

