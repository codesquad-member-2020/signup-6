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
    static let idValid = NSNotification.Name("idValid")
    static let idInvalid = NSNotification.Name("idInvalid")
    static let passwordValid = NSNotification.Name("passwordValid")
    static let passwordInvalid = NSNotification.Name("passwordInvalid")
    private let idRegExr = "^[a-z0-9_-]{5,20}$"
    private let upperCase = "[A-Z]"
    private let lowerCase = "[a-z]"
    private let number = "[0-9]"
    private let specialCharacter = "[!@#$%^*+=~&_;:-]"

    func verifyIdInput(id: String) {
        if !match(regExr: idRegExr, with: id).isEmpty {
            NotificationCenter.default.post(name: InputVerifier.idValid, object: nil)
        } else {
            NotificationCenter.default.post(name: InputVerifier.idInvalid, object: nil)
        }
    }
    
    func verifyPasswordInput(password: String) {
        var notIncludedElements = [EssentialElement]()
        guard password.count >= 8, password.count <= 16 else {
            NotificationCenter.default.post(name: InputVerifier.passwordInvalid, object: nil, userInfo: [InputVerifier.passwordInvalid:""])
            return
        }
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
        if notIncludedElements.isEmpty {
            NotificationCenter.default.post(name: InputVerifier.passwordValid, object: nil)
        } else {
            let result = notIncludedElements.map { $0.rawValue }.joined(separator: ", ")
            NotificationCenter.default.post(name: InputVerifier.passwordInvalid, object: nil, userInfo: [InputVerifier.passwordInvalid:result])
        }
    }
    
    private func match(regExr: String, with string: String) -> [NSTextCheckingResult] {
        let regularExpression = try! NSRegularExpression(pattern: regExr, options: .anchorsMatchLines)
        let result = regularExpression.matches(in: string, options: [], range: NSRange(location: 0, length: string.count))
        return result
    }
}
