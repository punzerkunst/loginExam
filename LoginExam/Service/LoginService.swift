//
//  LoginService.swift
//  LoginExam
//
//  Created by Jose Mari Pascual on 8/22/24.
//

import Foundation
import Combine

class LoginService {
    static let shared = LoginService()
    
    private init() {}

    func login(username: String, password: String) -> AnyPublisher<Bool, Never> {
        // Simulate network delay
        return Future<Bool, Never> { promise in
                    DispatchQueue.global().asyncAfter(deadline: .now() + 3.0) {
                        // Simulate a network request delay
                        promise(.success(true))
                    }
                }
                .eraseToAnyPublisher()
    }
}
