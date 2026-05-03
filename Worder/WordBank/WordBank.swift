//
//  WordBank.swift
//  Worder
//
//  Created by Andre jones on 4/26/26.
//

import Foundation
/*
Description:
Contains the initial words to be loaded in our Trie.
Responsibilities:
    - Manage words to be inserted in the Trie
Notes:
    - Will not contain any of the new words inserted by the user.
*/


struct WordBank {
    var words: [String]
    
    init(words: [String]) {
        self.words = words
    }
}

extension WordBank {
    static let words = [
        // Programming / CS
        "algorithm","array","binary","boolean","class","closure","compile","compiler",
        "constant","data","debug","function","hashmap","heap","index","integer",
        "interface","loop","memory","node","object","pointer","queue","recursion",
        "stack","string","structure","tree","variable",

        // Apple / Swift / iOS
        "apple","app","application","appstore","async","await","bundle","coredata",
        "delegate","framework","ios","ipad","iphone","mac","macbook","objectivec",
        "protocol","swift","swiftui","uikit","view","viewmodel","xcode",

        // Strong autocomplete clusters
        "sw","swift","swiftui","switch","swipe",
        "apply","application","app","apple",
        "compile","compiler","completion",
        "record","recover","recursion",
        "database","dataset","datatype",
        "viewer","viewmodel",

        // Common English
        "about","after","before","better","between","create","delete","enter",
        "first","found","great","input","output","search","system","update","value",

        // Fitness
        "bench","cardio","deadlift","fitness","gym","health","lift","muscle",
        "protein","rep","set","strength","training","workout",

        // Music
        "audio","beat","drum","guitar","melody","mix","producer","sound","tempo","track"
    ]
}
