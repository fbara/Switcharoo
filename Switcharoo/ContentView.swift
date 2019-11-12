//
//  ContentView.swift
//  Switcharoo
//
//  Created by Frank Bara on 11/12/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("Switcharoo")
            .padding()
            
            Spacer()
            
            HStack {
                ForEach(0..<4) { number in
                    Letter(text: "A")
                }
            }
            
            Spacer()
            
            HStack {
                ForEach(0..<10) { number in
                    Letter(text: "A")
                }
            }
        }
        .frame(width: 1024, height: 768)
    .background(Image("Background"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
