//
//  LoginExamApp.swift
//  LoginExam
//
//  Created by Jose Mari Pascual on 8/22/24.
//

import SwiftUI

@main
struct LoginExamApp: App {
    
    @Namespace private var animation
    @StateObject var viewModel = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            if viewModel.isLoggedIn {
                WelcomeView(namespace: animation)
                    .environmentObject(viewModel)
            } else {
                LoginView(namespace: animation)
                    .environmentObject(viewModel)
            }
        }
    }
}
