//
//  PlusView.swift
//  Worder
//
//  Created by Andre jones on 4/27/26.
//

import SwiftUI

struct PlusView: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(Color.green)
                .frame(width: 35)
            Text("+")
                .foregroundStyle(.white)
        }
        
    }
}

#Preview {
    PlusView()
}
