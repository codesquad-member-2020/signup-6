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
    
    @IBOutlet weak var idTextField: InputTextField! {
        didSet {
            idTextField.addTarget(self, action: #selector(idTextFieldDidChange(_:)), for: .editingChanged)
        }
    }
    @IBOutlet weak var idStatusLabel: StatusMessageLabel!
    @IBOutlet weak var passwordTextField: InputTextField! {
        didSet {
            passwordTextField.addTarget(self, action: #selector(passwordTextFieldEditingEnd(_:)), for: .editingDidEnd)
        }
    }
    @IBOutlet weak var passwordStatusLabel: StatusMessageLabel!
    @IBOutlet weak var passwordConfirmTextField: InputTextField!
    @IBOutlet weak var passwordConfirmStatusLabel: StatusMessageLabel!
    @IBOutlet weak var nameTextField: InputTextField!
    @IBOutlet weak var nameStatusLabel: StatusMessageLabel!
    
    @objc func idTextFieldDidChange(_ textField: InputTextField) {
        guard let changes = textField.text else { return }
        delegate?.idTextFieldChanged(changes: changes)
    }
    
    @objc func passwordTextFieldEditingEnd(_ textField: InputTextField) {
        guard let changes = textField.text else { return }
        delegate?.passwordTextFieldEditingEnd(changes: changes)
    }
    
    func idValid() {
        idStatusLabel.alpha = 1
        idStatusLabel.text = "사용가능한 아이디입니다."
        idStatusLabel.textColor = .systemGreen
        idTextField.layer.borderColor = UIColor.black.cgColor
    }
    
    func idInvalid() {
        idStatusLabel.alpha = 1
        idStatusLabel.text = "5~20자의 영문 소문자, 숫자, 특수기호 (_)(-) 만 사용가능합니다."
        idStatusLabel.textColor = .red
        idTextField.layer.borderColor = UIColor.red.cgColor
    }
    
    func passwordValid() {
        passwordStatusLabel.alpha = 1
        passwordStatusLabel.text = "안전한 비밀번호입니다."
        passwordStatusLabel.textColor = .systemGreen
        passwordTextField.layer.borderColor = UIColor.black.cgColor
    }
    
    func passwordInvalid(with statusMessage: String) {
        passwordStatusLabel.alpha = 1
        if statusMessage == "" {
            passwordStatusLabel.text = "8자 이상 16자 이하로 입력해주세요."
        } else {
            passwordStatusLabel.text = "\(statusMessage)를 최소 1자 이상 포함해주세요."
        }
        passwordStatusLabel.textColor = .red
        passwordTextField.layer.borderColor = UIColor.red.cgColor
    }
}
