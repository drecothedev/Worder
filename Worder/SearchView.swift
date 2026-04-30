//
//  SearchView.swift
//  Worder
//
//  Created by Andre jones on 4/27/26.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchWord: String
    let placeholder: String = "hello"
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)

            TextField(placeholder, text: $searchWord)
                .autocorrectionDisabled()
                .textCase(.lowercase)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial.opacity(0.3))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.secondary.opacity(0.25), lineWidth: 1)
        )
    }
}

#Preview {
    SearchView(searchWord: .constant("hello"))
}
