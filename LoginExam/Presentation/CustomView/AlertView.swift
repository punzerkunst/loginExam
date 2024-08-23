//
//  AlertView.swift
//  LoginExam
//
//  Created by Jose Mari Pascual on 8/23/24.
//

import SwiftUI

struct AlertView: View {
    
    let alertModel: AlertModel
    @Binding var showAlert: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Text(alertModel.title)
                .foregroundStyle(.black)
                .bold()
                .font(.largeTitle)
                .accessibilityIdentifier("AlertTitle")
            Text(alertModel.message)
                .foregroundStyle(.black)
                .font(.body)
                .multilineTextAlignment(.center)
                .accessibilityIdentifier("AlertMessage")
            Button {
                withAnimation {
                    showAlert = false
                }
            } label: {
                HStack {
                    Spacer()
                    Text("OK")
                        .foregroundStyle(Color.white)
                        .padding()
                    Spacer()
                }
            }
            .background(Color.gradientGreen)
            .clipShape(Capsule())
            .padding()
            .defaultShadow()
            .accessibilityIdentifier("AlertButton")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
            .fill(Color.defaultWhite)
            .defaultShadow()
        )
        .padding()
    }
}

#Preview {
    AlertView(
        alertModel: .init(title: "Success", message: "Success Message"), showAlert: .constant(false)
    )
}
