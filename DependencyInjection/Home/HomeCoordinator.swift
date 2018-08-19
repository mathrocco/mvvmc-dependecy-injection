//
//  HomeCoordinator.swift
//  DependencyInjection
//
//  Created by Matheus Rocco Ferreira on 12/08/2018.
//  Copyright © 2018 Rocco. All rights reserved.
//

import UIKit

class HomeCoordinator {
    private let factory: HomeFactory

    init(factory: HomeFactory) {
        self.factory = factory
    }

    func start(_ navigationController: UINavigationController) {
        let homeViewController = factory.makeHomeViewController(coordinator: self)
        navigationController.viewControllers = [homeViewController]
    }
}
