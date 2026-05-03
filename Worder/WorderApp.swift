//
//  WorderApp.swift
//  Worder
//
//  Created by Andre jones on 4/26/26.
//

import SwiftUI

@main
struct WorderApp: App {
    @StateObject private var trie = Trie(words: WordBank.words)

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(trie)
        }
    }
}
