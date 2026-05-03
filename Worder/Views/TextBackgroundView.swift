//
//  TextBackgroundView.swift
//  Worder
//
//  Created by Andre jones on 4/27/26.
//

import SwiftUI

struct TextBackgroundView: View {
    var text: String
    var body: some View {
        ZStack {
            Text(text)
                .foregroundStyle(.primary)
            Capsule()
                .stroke(.ultraThickMaterial)
                .stroke(.gray.gradient)
                .frame(width: 110, height: 40)
        }
    }
}

#Preview {
    TextBackgroundView(text: "hello")
}
