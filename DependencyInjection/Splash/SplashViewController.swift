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

    lazy var viewModel: SplashViewModel = {
        return factory.makeSplashViewModel(coordinator: coordinator)
    }()

    init(factory: SplashFactory, _ coordinator: SplashCoordinatingActions) {
        self.factory = factory
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let splashView = factory.makeSplashView(viewModel: viewModel)
        view = splashView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.performLogin()
    }
}
