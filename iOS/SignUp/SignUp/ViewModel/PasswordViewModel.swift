//
//  PasswordViewModel.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/26.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class PasswordViewModel {
    enum EssentialElement: String {
        case upperCase = "영문 대문자"
        case lowerCase = "영문 소문자"
        case number = "숫자"
        case specialCharacter = "특수문자"
    }
    private let upperCase = "[A-Z]"
    private let lowerCase = "[a-z]"
    private let number = "[0-9]"
    private let specialCharacter = "[!@#$%^*+=~&_;:-]"
    private var statusMessage: String?
    var password = Dynamic<String>.init("")
    var passwordConfirm = Dynamic<String>.init("")
    var passwordDidChanged: ((Bool, String?) -> Void) = { _, _ in }
    var passwordConfirmDidChanged: (Bool) -> Void = { _ in }
    var isPasswordValid = Dynamic<Bool>.init(false)
    var isPasswordConfirmed = Dynamic<Bool>.init(false)
    
    init() {
        password.boundClosure = { text in
            self.isPasswordValid.value = self.verifyPasswordInput(password: text) { (status) in
                self.statusMessage = status
            }
            if self.passwordConfirm.value!.count != 0 {
                self.isPasswordConfirmed.value = self.passwordConfirm.value == text
            }
        }
        isPasswordValid.boundClosure = { result in
            self.passwordDidChanged(result, self.statusMessage)
        }
        passwordConfirm.boundClosure = { text in
            if self.passwordConfirm.value!.count != 0 {
                self.isPasswordConfirmed.value = self.password.value == text
            }
        }
        isPasswordConfirmed.boundClosure = { result in
            self.passwordConfirmDidChanged(result)
        }
    }
    
    private func verifyPasswordInput(password: String, handler: @escaping (_: String) -> ()) -> Bool {
        var notIncludedElements = [EssentialElement]()
        guard password.count >= 8, password.count <= 16 else {
            handler("")
            return false
        }
        if password.match(with: upperCase).isEmpty {
            notIncludedElements.append(.upperCase)
        }
        if password.match(with: lowerCase).isEmpty {
            notIncludedElements.append(.lowerCase)
        }
        if password.match(with: number).isEmpty {
            notIncludedElements.append(.number)
        }
        if password.match(with: specialCharacter).isEmpty {
            notIncludedElements.append(.specialCharacter)
        }
        if notIncludedElements.isEmpty {
            return true
        } else {
            let result = notIncludedElements.map { $0.rawValue }.joined(separator: ", ")
            handler(result)
            return false
        }
    }
}
