//
//  AppDelegate.swift
//  DependencyInjection
//
//  Created by Matheus Rocco Ferreira on 09/08/2018.
//  Copyright © 2018 Rocco. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = UIWindow()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        let container = DependencyContainer()
        let splashCoordinator = container.makeSplashCoordinator()
        splashCoordinator.start(navigationController)
        return true
    }
}
