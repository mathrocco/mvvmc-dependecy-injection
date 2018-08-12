//
//  AppDelegate.swift
//  DependencyInjection
//
//  Created by Matheus Rocco Ferreira on 09/08/2018.
//  Copyright © 2018 Rocco. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = UIWindow()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        let container = DependencyContainer()
        let splashCoordinator = container.makeSplashCoordinator()
        splashCoordinator.start(navigationController)
        return true
    }
}


protocol SplashFactory {
    func makeSplashViewController(coordinator: SplashCoordinatingActions) -> SplashViewController
    func makeSplashCoordinator() -> SplashCoordinator
}

protocol HomeFactory {
    func makeHomeViewController(coordinator: HomeCoordinator) -> UIViewController
    func makeHomeCoordinator() -> HomeCoordinator
}

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

class SplashCoordinator {
    private let factory: SplashFactory & HomeFactory

    init(factory: SplashFactory & HomeFactory) {
        self.factory = factory
    }

    func start(_ navigationController: UINavigationController) {
        let splashViewController = factory.makeSplashViewController(coordinator: self)
        navigationController.viewControllers = [splashViewController]
    }
}

extension SplashCoordinator: SplashCoordinatingActions {
    func nextVC(viewController: UIViewController) {
        guard let navigationController = viewController.navigationController else {
            fatalError("Current view controller doens't bellong to a navigation stack")
        }
        let homeCoordinator = factory.makeHomeCoordinator()
        homeCoordinator.start(navigationController)
    }
}

protocol SplashCoordinatingActions {
    func nextVC(viewController: UIViewController)
}

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

class HomeCoordinator {
    private let factory: HomeFactory

    init(factory: HomeFactory) {
        self.factory = factory
    }

    func start(_ navigationController: UINavigationController) {
        let homeViewController = factory.makeHomeViewController(coordinator: self)
        navigationController.pushViewController(homeViewController, animated: true)
    }
}
