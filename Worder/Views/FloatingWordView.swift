//
//  FloatingWordView.swift
//  Worder
//
//  Created by Andre jones on 4/27/26.
//

import SwiftUI
internal import Combine

struct FloatingWordView: View {
    @State private var yOffset: CGFloat = 0
    @State private var scale: CGFloat = 1.0
    @State private var opacity: Double = 1.0

    var word: String
    @Binding var isDone: Bool

    var body: some View {
        GeometryReader { geo in
            ZStack {
                TextBackgroundView(text: word)
                    .scaleEffect(scale)
                    .opacity(opacity)
                    .position(
                        x: geo.size.width / 2,
                        y: geo.size.height / 2
                    )
                    .offset(y: yOffset)
                    .onAppear {
                        withAnimation(.spring(response: 0.9, dampingFraction: 0.8)) {
                            yOffset = -(geo.size.height / 2) + 70
                            scale = 0.35
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            withAnimation(.easeOut(duration: 0.25)) {
                                opacity = 0
                            }

                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                isDone = true
                            }
                        }
                    }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

#Preview {
    FloatingWordView(word: "hello",isDone: .constant(false))
}
