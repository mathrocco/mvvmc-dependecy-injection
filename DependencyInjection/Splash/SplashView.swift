//
//  SplashView.swift
//  DependencyInjection
//
//  Created by Matheus Rocco Ferreira on 14/08/2018.
//  Copyright © 2018 Rocco. All rights reserved.
//

import UIKit

protocol SplashViewModelViewDelegate: class {}

class SplashView: UIView, SplashViewModelViewDelegate {

    let viewModel: SplashViewModel

    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        viewModel.viewDelegate = self
        loadView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func loadView() {
        backgroundColor = .red
        addButton()
    }

    func addButton() {
        let origin = CGPoint.init(x: 200, y: 200)
        let buttonFrame = CGRect(origin: origin, size: .init(width: 100, height: 50))
        let button = UIButton(frame: buttonFrame)
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        addSubview(button)
    }

    @objc func buttonAction(sender: Any) {
        viewModel.goHome()
    }
}
