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
    var idViewModel = IdViewModel()
    var passwordViewModel = PasswordViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldDelegate()
        setBindings()
    }
    
    func setBindings() {
        signUpView.idTextField.bind { self.idViewModel.id.value = $0 }
        idViewModel.idDidChanged = { result in
            if result {
                self.signUpView.idValid()
            } else {
                self.signUpView.idInvalid()
            }
        }
        signUpView.passwordTextField.bind { self.passwordViewModel.password.value = $0 }
        passwordViewModel.passwordDidChanged = { result, status in
            if result {
                self.signUpView.passwordValid()
            } else {
                self.signUpView.passwordInvalid(with: status!)
            }
        }
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
