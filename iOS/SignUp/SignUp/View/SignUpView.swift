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
    @IBOutlet weak var nextButton: NextButton!
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        idTextField.addTarget(self, action: #selector(idTextFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldEditingEnd(_:)), for: .editingDidEnd)
        passwordConfirmTextField.addTarget(self, action: #selector(confirmPassword(_:)), for: .editingDidEnd)
        nameTextField.addTarget(self, action: #selector(nameDidEntered), for: .editingDidEnd)
    }
    
    @objc private func idTextFieldDidChange(_ textField: InputTextField) {
        guard let changes = textField.text else { return }
        delegate?.idTextFieldChanged(changes: changes)
    }
    
    @objc private func passwordTextFieldEditingEnd(_ textField: InputTextField) {
        guard let changes = textField.text else { return }
        delegate?.passwordTextFieldEditingEnd(changes: changes)
        confirmPassword(passwordConfirmTextField)
    }
    
    @objc private func confirmPassword(_ textField: InputTextField) {
        if passwordTextField.text == textField.text {
            passwordMatch()
        } else {
            passwordMismatch()
        }
    }
    
    @objc private func nameDidEntered() {
        guard let name = nameTextField.text, !name.isEmpty else {
            nameNotEntered()
            return
        }
        nameStatusLabel.isValid = true
        nameStatusLabel.alpha = 0
        nameTextField.layer.borderColor = UIColor.black.cgColor
        checkCondition()
    }
    
    func idValid() {
        idStatusLabel.isValid = true
        idStatusLabel.text = "사용가능한 아이디입니다."
        idTextField.layer.borderColor = UIColor.black.cgColor
        checkCondition()
    }
    
    func idInvalid() {
        idStatusLabel.isValid = false
        idStatusLabel.text = "5~20자의 영문 소문자, 숫자, 특수기호 (_)(-) 만 사용가능합니다."
        idTextField.layer.borderColor = UIColor.red.cgColor
        checkCondition()
    }
    
    func passwordValid() {
        passwordStatusLabel.isValid = true
        passwordStatusLabel.text = "안전한 비밀번호입니다."
        checkCondition()
    }
    
    func passwordInvalid(with statusMessage: String) {
        passwordStatusLabel.isValid = false
        if statusMessage == "" {
            passwordStatusLabel.text = "8자 이상 16자 이하로 입력해주세요."
        } else {
            passwordStatusLabel.text = "\(statusMessage)를 최소 1자 이상 포함해주세요."
        }
        passwordTextField.layer.borderColor = UIColor.red.cgColor
        checkCondition()
    }
    
    private func passwordMatch() {
        if passwordConfirmTextField.text?.count != 0 {
            passwordConfirmStatusLabel.isValid = true
            passwordConfirmStatusLabel.text = "비밀번호가 일치합니다."
        }
        passwordConfirmTextField.layer.borderColor = UIColor.black.cgColor
        checkCondition()
    }
    
    private func passwordMismatch() {
        passwordConfirmStatusLabel.isValid = false
        passwordConfirmStatusLabel.text = "비밀번호가 일치하지 않습니다."
        passwordConfirmTextField.layer.borderColor = UIColor.red.cgColor
        checkCondition()
    }
    
    private func nameNotEntered() {
        nameStatusLabel.isValid = false
        nameStatusLabel.text = "이름은 필수 입력 항목입니다."
        nameTextField.layer.borderColor = UIColor.red.cgColor
    }
    
    private func checkCondition() {
        guard idStatusLabel.isValid == true else { return }
        guard passwordStatusLabel.isValid == true else { return }
        guard passwordConfirmStatusLabel.isValid == true else { return }
        guard nameStatusLabel.isValid == true else {
            nameNotEntered()
            return
        }
        nextButton.isEnabled = true
    }
}
