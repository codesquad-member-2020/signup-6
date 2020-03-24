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
    
    func verifyPasswordInput(password: String) -> (Bool, [String]) {
        var notIncludedElements = [String]()
        guard password.count >= 8, password.count <= 16 else { return (false, notIncludedElements) }
        var regExr = try! NSRegularExpression(pattern: "[A-Z]", options: .anchorsMatchLines)
        if regExr.matches(in: password, options: [], range: NSRange(location: 0, length: password.count)).count == 0 {
            notIncludedElements.append("영문 대문자")
        }
        regExr = try! NSRegularExpression(pattern: "[a-z]", options: .anchorsMatchLines)
        if regExr.matches(in: password, options: [], range: NSRange(location: 0, length: password.count)).count == 0 {
            notIncludedElements.append("영문 소문자")
        }
        regExr = try! NSRegularExpression(pattern: "[0-9]", options: .anchorsMatchLines)
        if regExr.matches(in: password, options: [], range: NSRange(location: 0, length: password.count)).count == 0 {
            notIncludedElements.append("숫자")
        }
        regExr = try! NSRegularExpression(pattern: "[!@#$$%^*+=-]", options: .anchorsMatchLines)
        if regExr.matches(in: password, options: [], range: NSRange(location: 0, length: password.count)).count == 0 {
            notIncludedElements.append("특수문자")
        }
        return (notIncludedElements.isEmpty, notIncludedElements)
    }
}
