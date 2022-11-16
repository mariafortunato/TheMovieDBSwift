//
//  AppDelegate.swift
//  TheMovieDBSwift
//
//  Created by Maria Alice Rodrigues Fortunato on 10/11/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let view = MovieViewController()
        let navigation = UINavigationController(rootViewController: view)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        return true
    }
}

