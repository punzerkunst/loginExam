//
//  View+Ext.swift
//  LoginExam
//
//  Created by Jose Mari Pascual on 8/22/24.
//

import SwiftUI

extension View {
    
    func defaultShadow() -> some View {
        self.shadow(radius: 2, x: 2, y: 2)
    }
    
    func transparentFullScreenCover<Content: View>(isPresented: Binding<Bool>, content: @escaping () -> Content) -> some View {
        fullScreenCover(isPresented: isPresented) {
            ZStack {
                content()
            }
            .background(TransparentBackgroundView())
        }
    }
}
