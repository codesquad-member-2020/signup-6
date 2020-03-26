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
        switch textField {
        case signUpView.idTextField:
            signUpView.passwordTextField.becomeFirstResponder()
        case signUpView.passwordTextField:
            signUpView.passwordConfirmTextField.becomeFirstResponder()
        case signUpView.passwordConfirmTextField:
            signUpView.nameTextField.becomeFirstResponder()
        default:
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
        signUpView.idTextField.bind { [weak self] in
            guard let self = self else { return }
            self.idViewModel.id.value = $0
        }
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
        signUpView.passwordTextField.bind { [weak self] in
            guard let self = self else { return }
            self.passwordViewModel.password.value = $0
        }
        signUpView.passwordConfirmTextField.bind { [weak self] in
            guard let self = self else { return }
            self.passwordViewModel.passwordConfirm.value = $0
        }
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
        signUpView.nameTextField.bind { [weak self] in
            guard let self = self else { return }
            self.nameViewModel.name.value = $0
        }
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
        guard idViewModel.isIdValid.value! else { return }
        guard passwordViewModel.isPasswordValid.value! else { return }
        guard passwordViewModel.isPasswordConfirmed.value! else { return }
        guard nameViewModel.isNameValid.value! else {
            self.signUpView.nameNotEntered()
            return
        }
        signUpView.enableNextButton()
    }
}
