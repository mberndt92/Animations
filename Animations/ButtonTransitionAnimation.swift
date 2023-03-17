//
//  ButtonTransitionAnimation.swift
//  Animations
//
//  Created by Maximilian Berndt on 2023/03/17.
//

import SwiftUI

struct ButtonTransitionAnimation: View {
    
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(.default, value: enabled)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
    }
}

struct ButtonTransitionAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTransitionAnimation()
    }
}
