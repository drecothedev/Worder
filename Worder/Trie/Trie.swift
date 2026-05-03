//
//  Trie.swift
//  Worder
//
//  Created by Andre jones on 4/26/26.
//

/*
Description:
Defines our Trie
    - A data structure also know as a prefix tree. Helps store words by storing letters individually.
    - We traverse the Trie to find words, insert words, and find words starting with a specific prefix.
    - Tries give us fast lookup, insert, and checking for a common prefix quickly.
    - Each Trie will contain children nodes representing subsequent characters. Each Trie will also contain a boolean marking whether it is the last character within the word.
Responsibilities:
    - Handle insert, find, and checking methods
    - Hold characters representing words based on their relationship with children nodes.
    - Mark the end of the words
    - Update the sugguest words based on the current prefix
    - Load initial words into word bank
Notes:
    - Gives us look up ability in a variety of ways. Time and space complexity is O(n) for inserts and lookups
*/

import Foundation
internal import Combine


class Trie: ObservableObject {
    var children: [Trie?] = Array(repeating: nil, count: 26)
    var isEnd: Bool = false
    
    @Published var suggestedWords: [String] = []
    
    // Initialize with words from word bank
    init(words: [String]) {
        for word in words {
            insert(key: word)
        }
    }
    
    // Generic initializer. Meant for adding nodes to Trie
    private init() {}

    
    /*
    Inserts a word into the Trie.

    - Parameter word: The word to be added to the Trie.
    - Complexity: O(n), where n is the length of the word.
    - Note: Creates new nodes only when necessary.
    */
    func insert(key: String) {
        // init current pointer with root node.
        var current = self
        
        for char in key {
            // Get index
            guard let c = char.asciiValue, let a = Character("a").asciiValue else { return }
            let i = Int(c) - Int(a)
            guard i >= 0 && i < 26 else {
                return
            }
            if current.children[i] == nil {
                current.children[i] = Trie()
            }
            current = current.children[i]!
        }

        current.isEnd = true
    }
    
    /*
    Searches a word into the Trie.

    - Parameter word: The word to be searched in the Trie.
    - Complexity: O(n), where n is the length of the word.
    - Note: If a node is not found we return false.
    */
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
    
    /*
    Checks for common prefix within the Trie

    - Parameter prefix: The current prefix
    - Complexity: O(n), where n is the length of the prefix.
    - Note:
    */
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
    
    /*
    Checks and returns all words with a common prefix

    - Parameter word: The current prefix
    - Complexity: O(n), where n is the length of the word.
    - Note: Returns all of the strings with a common prefix.
    */
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
    
    /*
    Helper DFS

    - Parameters:
        - root: Current Trie to be traversed
        - currentWord: prefix checking for
        - words: words matching the current prefix
    - Complexity: O(n), where n is the length of the word.
    - Note: Returns all of the strings with a common prefix.
    */
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



