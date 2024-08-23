//
//  ContentView.swift
//  LoginExam
//
//  Created by Jose Mari Pascual on 8/22/24.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    let namespace: Namespace.ID
    
    let gradientBackground = LinearGradient(gradient: Gradient(colors: [.gradientGreen, .gradientWhite]), startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            gradientBackground.ignoresSafeArea()
            VStack(spacing: 20) {
                Spacer()
                Text("**Welcome,**\nLog in to continue.")
                    .font(.largeTitle)
                    .foregroundStyle(.defaultWhite)
                    .padding(.vertical)
                    .multilineTextAlignment(.leading)
                
                LoginTextField(
                    text: $viewModel.username,
                    placeholder: "Username",
                    isSecuredTextEntry: false
                )
                LoginTextField(
                    text: $viewModel.password,
                    placeholder: "Password",
                    isSecuredTextEntry: true
                )
                
                Button {
                    viewModel.login()
                } label: {
                    HStack {
                        Spacer()
                        Text("Log in")
                            .foregroundStyle(Color.white)
                            .padding()
                        if viewModel.isLoading {
                            ProgressView()
                                .progressViewStyle(.automatic)
                                .tint(.white)
                                .accessibilityIdentifier("progressView")
                        }
                        Spacer()
                    }
                }
                .accessibilityIdentifier("LoginButton")
                .background(
                    Color.gradientGreen
                        .matchedGeometryEffect(id: "background", in: namespace)
                )
                .clipShape(Capsule())
                .padding(.vertical)
                .defaultShadow()
                Spacer()
            }
            .padding()
        }
        .blur(radius: viewModel.showAlert ? 3.0 : 0)
        .transparentFullScreenCover(isPresented: $viewModel.showAlert) {
            AlertView(alertModel: viewModel.alertModel, showAlert: $viewModel.showAlert)
        }
    }
}

#Preview {
    LoginView(namespace: Namespace().wrappedValue)
        .environmentObject(MainViewModel())
}
