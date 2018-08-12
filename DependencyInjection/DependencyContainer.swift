//
//  DependencyContainer.swift
//  DependencyInjection
//
//  Created by Matheus Rocco Ferreira on 12/08/2018.
//  Copyright © 2018 Rocco. All rights reserved.
//

import UIKit

class DependencyContainer {}

extension DependencyContainer: SplashFactory {
    func makeSplashViewController(coordinator: SplashCoordinatingActions) -> SplashViewController {
        let viewController = SplashViewController(factory: self, coordinator)
        return viewController
    }

    func makeSplashCoordinator() -> SplashCoordinator {
        let coordinator = SplashCoordinator(factory: self)
        return coordinator
    }
}

extension DependencyContainer: HomeFactory {
    func makeHomeViewController(coordinator: HomeCoordinator) -> UIViewController {
        let homeViewController = HomeViewController(factory: self, coordinator)
        return homeViewController
    }

    func makeHomeCoordinator() -> HomeCoordinator {
        let coordinator = HomeCoordinator(factory: self)
        return coordinator
    }
}