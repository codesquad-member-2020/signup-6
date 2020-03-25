//
//  ViewController.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var signUpView: SignUpView {
        self.view as! SignUpView
    }
    private var idViewModel = IdViewModel()
    private var passwordViewModel = PasswordViewModel()
    private var nameViewModel = NameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldDelegate()
        setBindings()
    }
}

extension ViewController: UITextFieldDelegate {
    private func setTextFieldDelegate() {
        signUpView.idTextField.delegate = self
        signUpView.passwordTextField.delegate = self
        signUpView.passwordConfirmTextField.delegate = self
        signUpView.nameTextField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blue.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.layer.borderColor == UIColor.blue.cgColor {
            textField.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        let nextResponder = signUpView.viewWithTag(nextTag) as UIResponder?
        if nextResponder != nil {
            nextResponder?.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
}

extension ViewController {
    private func setBindings() {
        bindIdViewModel()
        bindPasswordViewModel()
        bindNameViewModel()
    }
    
    private func bindIdViewModel() {
        signUpView.idTextField.bind { self.idViewModel.id.value = $0 }
        idViewModel.idDidChanged = { result in
            if result {
                self.signUpView.idValid()
            } else {
                self.signUpView.idInvalid()
            }
            self.checkCondition()
        }
    }
    
    private func bindPasswordViewModel() {
        signUpView.passwordTextField.bind { self.passwordViewModel.password.value = $0 }
        signUpView.passwordConfirmTextField.bind { self.passwordViewModel.passwordConfirm.value = $0 }
        passwordViewModel.passwordDidChanged = { result, status in
            if result {
                self.signUpView.passwordValid()
            } else {
                self.signUpView.passwordInvalid(with: status!)
            }
            self.checkCondition()
        }
        passwordViewModel.passwordConfirmDidChanged = { result in
            if result {
                self.signUpView.passwordMatch()
            } else {
                self.signUpView.passwordMismatch()
            }
            self.checkCondition()
        }
    }
    
    private func bindNameViewModel() {
        signUpView.nameTextField.bind { self.nameViewModel.name.value = $0 }
        nameViewModel.nameDidChanged = { result in
            if result {
                self.signUpView.nameEntered()
            } else {
                self.signUpView.nameNotEntered()
            }
            self.checkCondition()
        }
    }
    
    private func checkCondition() {
        signUpView.disableNextButton()
        guard idViewModel.isIdValid else { return }
        guard passwordViewModel.isPasswordValid else { return }
        guard passwordViewModel.isPasswordConfirmed else { return }
        guard nameViewModel.isNameValid else {
            self.signUpView.nameNotEntered()
            return
        }
        signUpView.enableNextButton()
    }
}
