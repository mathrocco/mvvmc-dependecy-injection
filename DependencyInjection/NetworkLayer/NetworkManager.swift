//
//  NetworkManager.swift
//  DependencyInjection
//
//  Created by Matheus Rocco Ferreira on 19/08/2018.
//  Copyright © 2018 Rocco. All rights reserved.
//

import Foundation

class NetworkManager {

    func performRequest(completion: @escaping (Bool, Error?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(true, nil)
        }
    }
}
