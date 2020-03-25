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
    private let inputVerifier = InputVerifier()
    var idViewModel = IdViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpView.delegate = self
        addObservers()
        setTextFieldDelegate()
        signUpView.idTextField.bind { self.idViewModel.id.value = $0 }
        idViewModel.idDidChanged = { result in
            if result {
                self.signUpView.idValid()
            } else {
                self.signUpView.idInvalid()
            }
        }
    }
}

extension ViewController: SignUpViewDelegate {
    func idTextFieldChanged(changes: String) {
        inputVerifier.verifyIdInput(id: changes)
    }
    
    func passwordTextFieldEditingEnd(changes: String) {
        inputVerifier.verifyPasswordInput(password: changes)
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
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(enteredPasswordValid), name: InputVerifier.passwordValid, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(enteredPasswordInvalid), name: InputVerifier.passwordInvalid, object: nil)
    }

    @objc private func enteredPasswordValid() {
        signUpView.passwordValid()
    }
    
    @objc private func enteredPasswordInvalid(_ notification: Notification) {
        guard let notIncludedElements = notification.userInfo?[InputVerifier.passwordInvalid] as? String else { return }
        signUpView.passwordInvalid(with: notIncludedElements)
    }
}
