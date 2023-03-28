//
//  PresentationStyleAppear.swift
//  Animations
//
//  Created by Maximilian Berndt on 2023/03/28.
//

import SwiftUI

struct PresentationStyleAppearView: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 200, height: 200)
                
                if isShowingRed {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 200, height: 200)
                        .transition(.pivot)
                }
            }
            .onTapGesture {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
        }
        .navigationTitle("Presentation Style Appearance")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PresentationStyleAppearView_Previews: PreviewProvider {
    static var previews: some View {
        PresentationStyleAppearView()
    }
}
