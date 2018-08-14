//
//  SplashFactory.swift
//  DependencyInjection
//
//  Created by Matheus Rocco Ferreira on 12/08/2018.
//  Copyright © 2018 Rocco. All rights reserved.
//

import UIKit

protocol SplashFactory {
    func makeSplashViewController(coordinator: SplashCoordinatingActions) -> SplashViewController
    func makeSplashCoordinator() -> SplashCoordinator
    func makeSplashView(viewModel: SplashViewModel) -> SplashView
    func makeSplashViewModel(coordinator: SplashCoordinatingActions) -> SplashViewModel
}
