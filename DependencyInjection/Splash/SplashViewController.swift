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

    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = .red
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addButton()
    }

    func addButton() {
        let buttonFrame = CGRect(origin: view.center, size: .init(width: 100, height: 50))
        let button = UIButton(frame: buttonFrame)
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func buttonAction(sender: Any) {
        coordinator.nextVC(viewController: self)
    }
}
