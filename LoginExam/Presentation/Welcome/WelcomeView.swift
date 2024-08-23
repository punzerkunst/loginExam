//
//  WelcomeView.swift
//  LoginExam
//
//  Created by Jose Mari Pascual on 8/22/24.
//

import SwiftUI

struct WelcomeView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    @State var didAppear = false
    @State var morph = false
    let namespace: Namespace.ID
    
    var body: some View {
        Group {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    if morph {
                        Text("Welcome!")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .onTapGesture {
                                withAnimation {
                                    viewModel.isLoggedIn = false
                                }
                            }
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.gradientGreen
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .transition(.scale(scale: 1))
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation {
                    morph = true
                }
            }
        })
        .ignoresSafeArea()
    }
}

#Preview {
    WelcomeView(namespace: Namespace().wrappedValue)
}
