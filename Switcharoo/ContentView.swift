//
//  ContentView.swift
//  Switcharoo
//
//  Created by Frank Bara on 11/12/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var activeLetters = [String](repeating: "Blank", count: 4)
    @State var tray = [String](repeating: "Blank", count: 10)
    
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
                }
            }
            
            Spacer()
            
            HStack {
                ForEach(0..<10) { number in
                    Letter(text: self.tray[number])
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
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
