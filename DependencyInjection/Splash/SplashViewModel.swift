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
    let coordinator: SplashCoordinatingActions
    let requester: LoginRequester

    init(requester: LoginRequester, coordinator: SplashCoordinatingActions) {
        self.requester = requester
        self.coordinator = coordinator
    }

    func performLogin() {
        requester.performLogin { [weak self] (success, error) in
            guard success == true else {
                self?.goLogin()
                return
            }

            self?.goHome()
        }
    }

    func goHome() {
        coordinator.nextVC()
    }

    func goLogin() {
        // TODO: Implement Login screen
        print("Go to login screen")
    }
}
