//
//  LoginRequester.swift
//  DependencyInjection
//
//  Created by Matheus Rocco Ferreira on 19/08/2018.
//  Copyright © 2018 Rocco. All rights reserved.
//

import Foundation

class LoginRequester {

    let networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    func performLogin(completion: @escaping (Bool, Error?) -> Void) {
        networkManager.performRequest(completion: completion)
    }
}
