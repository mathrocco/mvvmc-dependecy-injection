//
//  SplashViewModel.swift
//  DependencyInjection
//
//  Created by Matheus Rocco Ferreira on 14/08/2018.
//  Copyright © 2018 Rocco. All rights reserved.
//

import Foundation

protocol SplashCoordinatingActions: class {
    func nextVC()
}

class SplashViewModel {
    weak var viewDelegate: SplashViewModelViewDelegate?
    var coordinator: SplashCoordinatingActions

    init(coordinator: SplashCoordinatingActions) {
        self.coordinator = coordinator
    }

    func performAutoLogin() {
        // add delay and log considering user token
    }

    func didLoginWithUser() {
        // call coordinator goLogin or goHome
    }

    func goHome() {
        coordinator.nextVC()
    }
}
