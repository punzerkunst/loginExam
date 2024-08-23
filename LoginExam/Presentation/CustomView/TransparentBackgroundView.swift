//
//  TransparentBackgroundView.swift
//  LoginExam
//
//  Created by Jose Mari Pascual on 8/23/24.
//

import SwiftUI

struct TransparentBackgroundView: UIViewRepresentable {

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
    
}
