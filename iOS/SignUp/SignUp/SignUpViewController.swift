//
//  SignUpViewController.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
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

extension SignUpViewController: UITextFieldDelegate {
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
        let nextTextFieldList: [UITextField: UITextField] = [
            signUpView.idTextField: signUpView.passwordTextField,
            signUpView.passwordTextField: signUpView.passwordConfirmTextField,
            signUpView.passwordConfirmTextField: signUpView.nameTextField
        ]
        guard let nextTextField = nextTextFieldList[textField] else {
            textField.resignFirstResponder()
            return false
        }
        nextTextField.becomeFirstResponder()
        return false
    }
}

extension SignUpViewController {
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
        idViewModel.idDuplicationChanged = { result in
            DispatchQueue.main.async {
                if result {
                    self.signUpView.idValid()
                } else {
                    self.signUpView.idDuplicate()
                }
                self.checkCondition()
            }
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
        guard idViewModel.idDuplication?.message ?? false else { return }
        guard passwordViewModel.isPasswordValid.value! else { return }
        guard passwordViewModel.isPasswordConfirmed.value! else { return }
        guard nameViewModel.isNameValid.value! else {
            self.signUpView.nameNotEntered()
            return
        }
        signUpView.enableNextButton()
    }
}
