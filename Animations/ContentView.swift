//
//  ContentView.swift
//  Animations
//
//  Created by Maximilian Berndt on 2023/03/16.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(
                amount: -90,
                anchor: .topLeading
            ),
            identity: CornerRotateModifier(
                amount: 0,
                anchor: .topLeading
            )
        )
    }
}

struct ContentView: View {
    
    enum AnimationSessions: String, CaseIterable {
        case AsymetricAnimation
        case ButtonTransitionAnimation
        case Pulsing
        case ScaleEffect
        case SnakeHelloWorld
        case ViewDragging
        
        @ViewBuilder
        func view() -> some View {
            switch self {
            case .AsymetricAnimation: AsymetricAnimatedView()
            case .ButtonTransitionAnimation: ButtonTransitionAnimationView()
            case .Pulsing: PulsingButton()
            case .ScaleEffect: ScaleEffectButton()
            case .SnakeHelloWorld: SnakeHelloWorldView()
            case .ViewDragging: CreditCardDrag()
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(AnimationSessions.allCases, id: \.rawValue) { lesson in
                    NavigationLink {
                        lesson.view()
                    } label: {
                        Text(lesson.rawValue)
                    }

                }

            }
            .navigationTitle("Animating in Swift UI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
