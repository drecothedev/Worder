//
//  Trie.swift
//  Worder
//
//  Created by Andre jones on 4/26/26.
//

import Foundation

class Trie {
    var children: [Trie?] = Array(repeating: nil, count: 26)
    var isEnd: Bool = false
    let words = WordBank.words
        
    
    func insertWords() {
        for word in words {
            insert(key: word)
        }
    }
    
    func insert(key: String) {
        // init current pointer with root node.
        var current = self
        print("adding word... \(key)")
        for char in key {
            // Get index
            guard let c = char.asciiValue, let a = Character("a").asciiValue else { return }
            let i = Int(c) - Int(a)
            guard i >= 0 && i < 26 else {
                return
            }
            if current.children[i] == nil {
                let newNode = Trie()
                current.children[i] = newNode
            }
            current = current.children[i]!
        }
        print("word added!")
        current.isEnd = true
    }
    
    func search(_ key: String) -> Bool {
        var current = self
        
        
        for char in key {
            guard let c = char.asciiValue, let a = Character("a").asciiValue else { return false }
            let i = Int(c) - Int(a)
            guard i >= 0 && i < 26 else {
                return false
            }
            if current.children[i] == nil {
                return false
            }
            current = current.children[i]!
        }
        
        
        return current.isEnd
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var current = self
        guard !prefix.isEmpty else { return false }
        for char in prefix {
            guard let c = char.asciiValue, let a = Character("a").asciiValue else { return false }
            let i = Int(c) - Int(a)
            guard i >= 0 && i < 26 else {
                return false
            }
            if current.children[i] == nil {
                return false
            }
            current = current.children[i]!
        }
        
        return true
    }
    
    func wordsStartingWith(_ prefix: String) -> [String] {
        var words: [String] = []
        var current = self
        
        guard !prefix.isEmpty else { return [] }
        
        for char in prefix {
            guard let c = char.asciiValue, let a = Character("a").asciiValue else { return [] }
            
            let i = Int(c) - Int(a)
            
            guard i >= 0 && i < 26 else {
                return []
            }
            
            guard let next = current.children[i] else {
                return []
            }
            
            current = next
        }
        dfs(current, currentWord: prefix, words: &words)
        return words
    }
    
    func dfs(_ root: Trie, currentWord: String, words: inout [String]) {
        let root = root
        if root.isEnd {
            words.append(currentWord)
        }
        
        for i in 0..<26 {
            if let child = root.children[i] {
                let char = Character(UnicodeScalar(i + 97)!)
                dfs(child,currentWord: currentWord + String(char), words: &words)
            }
        }
    }
}



