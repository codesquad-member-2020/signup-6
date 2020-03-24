//
//  InputVerifier.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class InputVerifier {
    private let idRegExr = "^[a-z0-9_-]{5,20}$"
    
    func verifyIdInput(id: String) -> Bool {
        let regExr = try! NSRegularExpression(pattern: idRegExr, options: .anchorsMatchLines)
        let result = regExr.matches(in: id, options: [], range: NSRange(location: 0, length: id.count))
        return !result.isEmpty
    }
}
