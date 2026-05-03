//
//  ContentView.swift
//  Worder
//
//  Created by Andre jones on 4/26/26.
//

import SwiftUI

struct ContentView: View {
    @State private var searchWord: String = ""
    @State private var doesContain: Bool = false
    @State private var isNewWordDetected: Bool = false
    @State private var suggestedWords: [String] = []
    @State private var isDone: Bool = false // Notifes if animation is done.
    @State private var addNewWord: Bool = false
    @State private var addedWordMessage: String = ""
    let trie = Trie()
    var body: some View {
        VStack {
            HStack {
                SearchView(searchWord: $searchWord)
                    .onChange(of: searchWord) { oldValue, newValue in
                        let word = newValue.lowercased()
                        if !addedWordMessage.isEmpty && word != addedWordMessage {
                            addedWordMessage = ""
                        }
                        withAnimation(.easeInOut) {
                            suggestedWords = trie.wordsStartingWith(word)
                        }

                        isNewWordDetected =
                            !word.isEmpty &&
                            !trie.search(word) &&
                            !trie.startsWith(word)
                    }
                if !searchWord.isEmpty && isNewWordDetected {
                    Button(action: {
                        let word = searchWord.lowercased()
                        addWord(word)
                        addedWordMessage = word
                        addNewWord = true
                    }, label: {
                        PlusView()
                    })
                }
            }
            if !addedWordMessage.isEmpty {
                Text("Added \"\(addedWordMessage)\"")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            if addNewWord {
                FloatingWordView(word: searchWord, isDone: $isDone)
                    .frame(height: 180)
            } else {
                SuggestionView(searchWord: $searchWord, suggestedWords: $suggestedWords)
            }
        }
        .onChange(of: isDone) { oldValue, newValue in
            // Reset once new word is added.
            if newValue {
                addNewWord = false
                isNewWordDetected = false
                searchWord = ""
                isDone = false
                suggestedWords = []
                addedWordMessage = ""
            }
        }
        .onAppear {
            trie.insertWords()
        }
        .frame(width: .infinity, height: .infinity)
    }
    
    func addWord(_ word: String) {
        trie.insert(key: word)
    }
}

#Preview {
    ContentView()
}
