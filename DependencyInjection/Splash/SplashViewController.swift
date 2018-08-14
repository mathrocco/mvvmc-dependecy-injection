//
//  SplashViewController.swift
//  DependencyInjection
//
//  Created by Matheus Rocco Ferreira on 12/08/2018.
//  Copyright © 2018 Rocco. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    private let factory: SplashFactory
    private let coordinator: SplashCoordinatingActions

    init(factory: SplashFactory, _ coordinator: SplashCoordinatingActions) {
        self.factory = factory
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let splashViewModel = factory.makeSplashViewModel(coordinator: coordinator)
        let splashView = factory.makeSplashView(viewModel: splashViewModel)
        view = splashView
    }
}
