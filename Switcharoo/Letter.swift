//
//  Letter.swift
//  Switcharoo
//
//  Created by Frank Bara on 11/12/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

import SwiftUI

struct Letter: View {
    @State var dragAmount = CGSize.zero
    var text: String
    
    var body: some View {
        Image(text)
            .frame(width: 90, height: 130)
            .offset(dragAmount)
            .zIndex(dragAmount == .zero ? 0 : 1)
            .gesture(
                DragGesture(coordinateSpace: .global)
                    .onChanged {
                        self.dragAmount = CGSize(width: $0.translation.width, height: -$0.translation.height)
                }
                .onEnded {_ in
                    self.dragAmount = .zero
                }
        )
    }
}

struct Letter_Previews: PreviewProvider {
    static var previews: some View {
        Letter(text: "A")
    }
}
