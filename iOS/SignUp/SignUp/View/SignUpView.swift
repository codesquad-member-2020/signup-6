//
//  SignUpView.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

protocol SignUpViewDelegate: class {
    func idTextFieldChanged(changes: String)
    func passwordTextFieldEditingEnd(changes: String)
}

class SignUpView: UIView {
    weak var delegate: SignUpViewDelegate?
    
    @IBOutlet weak var idTextField: InputTextField!
    @IBOutlet weak var idStatusLabel: StatusMessageLabel!
    @IBOutlet weak var passwordTextField: InputTextField!
    @IBOutlet weak var passwordStatusLabel: StatusMessageLabel!
    @IBOutlet weak var passwordConfirmTextField: InputTextField!
    @IBOutlet weak var passwordConfirmStatusLabel: StatusMessageLabel!
    @IBOutlet weak var nameTextField: InputTextField!
    @IBOutlet weak var nameStatusLabel: StatusMessageLabel!
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        idTextField.addTarget(self, action: #selector(idTextFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldEditingEnd(_:)), for: .editingDidEnd)
        passwordConfirmTextField.addTarget(self, action: #selector(confirmPassword(_:)), for: .editingDidEnd)
    }
    
    @objc func idTextFieldDidChange(_ textField: InputTextField) {
        guard let changes = textField.text else { return }
        delegate?.idTextFieldChanged(changes: changes)
    }
    
    @objc func passwordTextFieldEditingEnd(_ textField: InputTextField) {
        guard let changes = textField.text else { return }
        delegate?.passwordTextFieldEditingEnd(changes: changes)
    }
    
    @objc func confirmPassword(_ textField: InputTextField) {
        if passwordTextField.text == textField.text {
            passwordMatch()
        } else {
            passwordMismatch()
        }
    }
    
    func idValid() {
        idStatusLabel.valid()
        idStatusLabel.text = "사용가능한 아이디입니다."
        idTextField.layer.borderColor = UIColor.black.cgColor
    }
    
    func idInvalid() {
        idStatusLabel.invalid()
        idStatusLabel.text = "5~20자의 영문 소문자, 숫자, 특수기호 (_)(-) 만 사용가능합니다."
        idTextField.layer.borderColor = UIColor.red.cgColor
    }
    
    func passwordValid() {
        passwordStatusLabel.valid()
        passwordStatusLabel.text = "안전한 비밀번호입니다."
    }
    
    func passwordInvalid(with statusMessage: String) {
        passwordStatusLabel.invalid()
        if statusMessage == "" {
            passwordStatusLabel.text = "8자 이상 16자 이하로 입력해주세요."
        } else {
            passwordStatusLabel.text = "\(statusMessage)를 최소 1자 이상 포함해주세요."
        }
        passwordTextField.layer.borderColor = UIColor.red.cgColor
    }
    
    func passwordMatch() {
        if passwordConfirmTextField.text?.count != 0 {
            passwordConfirmStatusLabel.valid()
            passwordConfirmStatusLabel.text = "비밀번호가 일치합니다."
        }
    }
    
    func passwordMismatch() {
        passwordConfirmStatusLabel.invalid()
        passwordConfirmStatusLabel.text = "비밀번호가 일치하지 않습니다."
        passwordConfirmTextField.layer.borderColor = UIColor.red.cgColor
    }
}
