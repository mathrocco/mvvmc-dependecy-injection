//
//  HomeViewController.swift
//  DependencyInjection
//
//  Created by Matheus Rocco Ferreira on 12/08/2018.
//  Copyright © 2018 Rocco. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    private let factory: HomeFactory
    private let coordinator: HomeCoordinator

    init(factory: HomeFactory, _ coordinator: HomeCoordinator) {
        self.factory = factory
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = .blue
    }
}
