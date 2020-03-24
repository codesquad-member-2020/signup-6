//
//  InputVerifier.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class InputVerifier {
    enum EssentialElement: String {
        case upperCase = "영문 대문자"
        case lowerCase = "영문 소문자"
        case number = "숫자"
        case specialCharacter = "특수문자"
    }
    private let idRegExr = "^[a-z0-9_-]{5,20}$"
    private let upperCase = "[A-Z]"
    private let lowerCase = "[a-z]"
    private let number = "[0-9]"
    private let specialCharacter = "[!@#$%^*+=~&_;:-]"

    func verifyIdInput(id: String) -> Bool {
        return !match(regExr: idRegExr, with: id).isEmpty
    }
    
    func verifyPasswordInput(password: String) -> (Bool, [EssentialElement]) {
        var notIncludedElements = [EssentialElement]()
        guard password.count >= 8, password.count <= 16 else { return (false, notIncludedElements) }
        if match(regExr: upperCase, with: password).isEmpty {
            notIncludedElements.append(.upperCase)
        }
        if match(regExr: lowerCase, with: password).isEmpty {
            notIncludedElements.append(.lowerCase)
        }
        if match(regExr: number, with: password).isEmpty {
            notIncludedElements.append(.number)
        }
        if match(regExr: specialCharacter, with: password).isEmpty {
            notIncludedElements.append(.specialCharacter)
        }
        return (notIncludedElements.isEmpty, notIncludedElements)
    }
    
    private func match(regExr: String, with string: String) -> [NSTextCheckingResult] {
        let regularExpression = try! NSRegularExpression(pattern: regExr, options: .anchorsMatchLines)
        let result = regularExpression.matches(in: string, options: [], range: NSRange(location: 0, length: string.count))
        return result
    }
}
