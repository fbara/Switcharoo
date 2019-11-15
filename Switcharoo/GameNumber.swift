//
//  GameNumber.swift
//  Switcharoo
//
//  Created by Frank Bara on 11/14/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

import SwiftUI

struct GameNumber: View {
    
    var text: String
    var value: Int
    
    var body: some View {
        VStack {
            Text(text)
            
            Text("\(value)")
                .font(.largeTitle)
        }
        .frame(maxWidth: .infinity)
    }
}

struct GameNumber_Previews: PreviewProvider {
    static var previews: some View {
        GameNumber(text: "Score", value: 0)
    }
}
