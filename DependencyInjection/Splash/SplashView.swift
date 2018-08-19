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
        addLabel()
    }

    func addLabel() {
        let origin = CGPoint.init(x: 100, y: 200)
        let labelFrame = CGRect(origin: origin, size: .init(width: 250, height: 50))
        let label = UILabel(frame: labelFrame)
        label.textColor = .white
        label.text = "I am your fake splash screen"
        addSubview(label)
    }
}
