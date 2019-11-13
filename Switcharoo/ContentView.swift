//
//  ContentView.swift
//  Switcharoo
//
//  Created by Frank Bara on 11/12/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var activeLetters = [String](repeating: "Blank", count: 4)
    @State private var tray = [String](repeating: "Blank", count: 10)
    @State private var buttonFrames = [CGRect](repeating: .zero, count: 4)
    
    let allowedWords = Bundle.main.words(from: "words.txt")
    let startWords = Bundle.main.words(from: "start.txt")
    
    var body: some View {
        VStack(spacing: 20) {
            Image("Switcharoo")
            .padding()
            
            Spacer()
            
            HStack {
                ForEach(0..<4) { number in
                    Letter(text: self.activeLetters[number])
                        .allowsHitTesting(false)
                        .overlay( GeometryReader { geo in
                            Color.clear
                                .onAppear {
                                    self.buttonFrames[number] = geo.frame(in: .global)
                                }
                            }
                            
                    )
                }
            }
            
            Spacer()
            
            HStack {
                ForEach(0..<10) { number in
                    Letter(text: self.tray[number], onChanged: self.letterMoved)
                }
            }
        }
        .frame(width: 1024, height: 768)
    .background(Image("Background"))
    .onAppear(perform: startGame)
    }
    
    func startGame() {
        let newWord = startWords.randomElement() ?? "CAPE"
        activeLetters = newWord.map(String.init)
        tray = (1...10).map { _ in self.randomLetter() }
    }
    
    func randomLetter() -> String {
        String("AAAAABBBCCCCCDDDDEEEEEEEFGGGHIIIJKLLLLMMMMNNNNOOOOOPPPQRRRSSSSTTTTUVWWXYZ".randomElement() ?? "E")
    }
    
    func letterMoved(location: CGPoint, letter: String) -> DragState {
        if let match = buttonFrames.firstIndex(where: {
            $0.contains(location) }) {
            if activeLetters[match] == letter { return .bad }
            
            var testLetters = activeLetters
            testLetters[match] = letter
            
            let testWord = String(testLetters.joined())
            
            if allowedWords.contains(testWord) {
                return .good
            } else {
                return .bad
            }
        } else {
            return .unknown
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
