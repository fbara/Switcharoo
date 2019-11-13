//
//  Bundle-WordLoading.swift
//  Switcharoo
//
//  Created by Frank Bara on 11/12/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

import Foundation

extension Bundle {
    func words(from filename: String) -> Set<String> {
        
        guard let fileURL = url(forResource: filename, withExtension: nil) else {
            fatalError("Can't find \(filename)")
        }
        
        guard let contents = try? String(contentsOf: fileURL) else {
            fatalError("Can't load \(filename)")
        }
        
        return Set(contents.components(separatedBy: "\n"))
    }
}
