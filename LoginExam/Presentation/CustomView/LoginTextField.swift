//
//  LoginTextField.swift
//  LoginExam
//
//  Created by Jose Mari Pascual on 8/22/24.
//

import SwiftUI

struct LoginTextField: View {
    
    @Binding var text: String
    let placeholder: String
    let isSecuredTextEntry: Bool
    
    var body: some View {
        Group {
            if isSecuredTextEntry {
                SecureField(text: $text) {
                    Text(placeholder)
                        .foregroundStyle(Color.gray)
                }
                .accessibilityIdentifier("PasswordTextField")
            } else {
                TextField(text: $text) {
                    Text(placeholder)
                        .foregroundStyle(Color.gray)
                }
                .accessibilityIdentifier("UsernameTextField")
            }
        }
        .foregroundStyle(Color.black)
        .padding()
        .textFieldStyle(.plain)
        .background(Color.appGray)
        .clipShape(Capsule())
        .defaultShadow()
    }
}

#Preview {
    LoginTextField(
        text: .constant("Username"),
        placeholder: "",
        isSecuredTextEntry: true
    )
}
