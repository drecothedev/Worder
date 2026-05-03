//
//  ShaderViewMods.swift
//  SwiftIsMyLife
//
//  Created by Andre jones on 11/7/25.
//

import Foundation
import SwiftUI

struct Twirl: Transition {
    func body(content: Content, phase: TransitionPhase) -> some View {
        // The view you are passing in; the view being shown to the user.
        
        // You track the phase of the view ( being added, being disappeared, etc.),
        // based on the phase you can add effects to the view.
        content
            .scaleEffect(phase.isIdentity ? 1.0 : 0.5)
            .opacity(phase.isIdentity ? 1 : 0)
            .blur(radius: phase.isIdentity ? 0 : 10)
            .rotationEffect(
                .degrees(
                    phase == .willAppear ? 360 :
                        phase == .didDisappear ? -360 : .zero
                )
            )
    }
}

struct PopUp: Transition {
    func body(content: Content, phase: TransitionPhase) -> some View {
        content
            .scaleEffect(phase.isIdentity ? 1.0 : 1.5)
            .opacity(phase.isIdentity ? 1.0 : 0)
            .blur(radius: phase.isIdentity ? 0 : 10)
    }
}


struct SlideIn: Transition {
    func body(content: Content, phase: TransitionPhase) -> some View {
        content
            .scaleEffect(phase.isIdentity ? 1.0 : 0.5)
            .rotationEffect(
                .degrees(
                    phase == .willAppear ? 360 :
                        phase == .didDisappear ? -360 : 0
                )
            )
            .offset(phase.isIdentity ? CGSize(width: 0, height: 0) : CGSize(width: -200, height: 0))
            .opacity(phase.isIdentity ? 1.0 : 0.0)
    }
}

struct Float: Transition {
    func body(content: Content, phase: TransitionPhase) -> some View {
        content
            .scaleEffect(phase.isIdentity ? 1.0 : 0.5)
            .offset(phase.isIdentity ? CGSize(width: 0, height: 0) : CGSize(width: 0, height: -200))
            .opacity(phase.isIdentity ? 1.0 : 0.0)
    }
}
