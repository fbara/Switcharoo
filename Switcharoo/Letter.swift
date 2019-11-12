//
//  Letter.swift
//  Switcharoo
//
//  Created by Frank Bara on 11/12/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

import SwiftUI

struct Letter: View {
    var text: String
    
    var body: some View {
        Image(text)
        .frame(width: 90, height: 130)
    }
}

struct Letter_Previews: PreviewProvider {
    static var previews: some View {
        Letter(text: "A")
    }
}
