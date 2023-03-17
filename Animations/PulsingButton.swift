//
//  PulsingButton.swift
//  Animations
//
//  Created by Maximilian Berndt on 2023/03/16.
//

import SwiftUI

struct PulsingButton: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap me") { }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                    .repeatForever(autoreverses: false),
                           value: animationAmount)
        )
        .onAppear {
            animationAmount = 2
        }
        
    }
}

struct PulsingButton_Previews: PreviewProvider {
    static var previews: some View {
        PulsingButton()
    }
}
