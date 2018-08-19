//
//  DependencyContainer.swift
//  DependencyInjection
//
//  Created by Matheus Rocco Ferreira on 12/08/2018.
//  Copyright © 2018 Rocco. All rights reserved.
//

import UIKit

class DependencyContainer {
    lazy var networkManager: NetworkManager = NetworkManager()
    lazy var loginRequester: LoginRequester = LoginRequester(networkManager: networkManager)
}

extension DependencyContainer: SplashFactory {
    func makeSplashView(viewModel: SplashViewModel) -> SplashView {
        let view = SplashView(viewModel: viewModel)
        return view
    }

    func makeSplashViewModel(coordinator: SplashCoordinatingActions) -> SplashViewModel {
        let viewModel = SplashViewModel(requester: loginRequester, coordinator: coordinator)
        return viewModel
    }

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
