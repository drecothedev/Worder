//
//  SuggestionView.swift
//  Worder
//
//  Created by Andre jones on 4/27/26.
//

import SwiftUI

struct SuggestionView: View {
    
    @Binding var searchWord: String
    @Binding var suggestedWords: [String]
    var words = WordBank.words
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(suggestedWords, id: \.self) { suggestedWord in
                    Button(action: {
                        searchWord = suggestedWord
                    }) {
                        TextBackgroundView(text: suggestedWord)
                            .foregroundStyle(.white)
                        
                    }
                    .transition(PopUp())
                    .padding(.vertical)
                }
            }
        }.scrollIndicators(.hidden)
    }
}

#Preview {
    SuggestionView(searchWord: .constant("Hee"),suggestedWords: .constant(["Hello", "world", "earth", "too", "gym", "fjajfoiaj", "hoeih"]))
}
