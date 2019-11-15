//
//  ShuffleTray.swift
//  Switcharoo
//
//  Created by Frank Bara on 11/14/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

import SwiftUI

struct ShuffleTray: View {
    var action: (() -> Void)?
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                self.action?()
            }) {
                Text("Shuffle Tray")
                    .font(.headline)
                .padding()
            }
        .buttonStyle(BorderlessButtonStyle())
            .foregroundColor(Color.red)
        .clipShape(Capsule())
            .foregroundColor(.white)
        }
        .padding([.trailing, .bottom])
    }
}

struct ShuffleTray_Previews: PreviewProvider {
    static var previews: some View {
        ShuffleTray()
    }
}
