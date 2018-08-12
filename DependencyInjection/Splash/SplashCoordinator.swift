//
//  SplashCoordinator.swift
//  DependencyInjection
//
//  Created by Matheus Rocco Ferreira on 12/08/2018.
//  Copyright © 2018 Rocco. All rights reserved.
//

import UIKit

class SplashCoordinator {
    private let factory: SplashFactory & HomeFactory

    init(factory: SplashFactory & HomeFactory) {
        self.factory = factory
    }

    func start(_ navigationController: UINavigationController) {
        let splashViewController = factory.makeSplashViewController(coordinator: self)
        navigationController.viewControllers = [splashViewController]
    }
}

protocol SplashCoordinatingActions {
    func nextVC(viewController: UIViewController)
}

extension SplashCoordinator: SplashCoordinatingActions {
    func nextVC(viewController: UIViewController) {
        guard let navigationController = viewController.navigationController else {
            fatalError("Current view controller doens't bellong to a navigation stack")
        }
        let homeCoordinator = factory.makeHomeCoordinator()
        homeCoordinator.start(navigationController)
    }
}
