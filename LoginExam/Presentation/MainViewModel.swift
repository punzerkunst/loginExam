//
//  MainViewModel.swift
//  LoginExam
//
//  Created by Jose Mari Pascual on 8/22/24.
//

import SwiftUI
import Combine

class MainViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var isLoading: Bool = false
    @Published var showAlert = false
    var alertModel: AlertModel = .init(title: "", message: "")
    private var cancellable: [AnyCancellable] = []
    
    func login() {
        guard !isLoading else { return }
        if username.isEmpty || password.isEmpty {
            alertModel = AlertModel(title: "Failed", message: "Username and password cannot be empty.")
            withAnimation {
                showAlert = true
            }
            return
        }
        withAnimation {
            isLoading = true
        }
        
        LoginService.shared.login(username: username, password: password)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                self?.username = ""
                self?.password = ""
                self?.isLoading = false
            } receiveValue: { [weak self] success in
                // This function always return true so we don't need to add any condition here.
                withAnimation(.easeOut(duration: 0.2)) {
                    self?.isLoggedIn = true // You can use @AppStorage to store this flag locally.
                }
            }
            .store(in: &cancellable)

    }
    
}
