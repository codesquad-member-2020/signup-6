//
//  SignUpView.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    @IBOutlet weak var idTextField: InputTextField!
    @IBOutlet weak var idStatusLabel: StatusMessageLabel!
    @IBOutlet weak var passwordTextField: InputTextField!
    @IBOutlet weak var passwordStatusLabel: StatusMessageLabel!
    @IBOutlet weak var passwordConfirmTextField: InputTextField!
    @IBOutlet weak var passwordConfirmStatusLabel: StatusMessageLabel!
    @IBOutlet weak var nameTextField: InputTextField!
    @IBOutlet weak var nameStatusLabel: StatusMessageLabel!
    @IBOutlet weak var nextButton: NextButton!
    
    func idValid() {
        idStatusLabel.isValid = true
        idStatusLabel.text = "사용가능한 아이디입니다."
        idTextField.layer.borderColor = UIColor.black.cgColor
    }
    
    func idInvalid() {
        idStatusLabel.isValid = false
        idStatusLabel.text = "5~20자의 영문 소문자, 숫자, 특수기호 (_)(-) 만 사용가능합니다."
        idTextField.layer.borderColor = UIColor.red.cgColor
    }
    
    func idDuplicate() {
        idStatusLabel.isValid = false
        idStatusLabel.text = "이미 사용중인 아이디입니다."
        idTextField.layer.borderColor = UIColor.red.cgColor
    }
    
    func passwordValid() {
        passwordStatusLabel.isValid = true
        passwordStatusLabel.text = "안전한 비밀번호입니다."
        passwordTextField.layer.borderColor = UIColor.black.cgColor
    }
    
    func passwordInvalid(with statusMessage: String) {
        passwordStatusLabel.isValid = false
        if statusMessage == "" {
            passwordStatusLabel.text = "8자 이상 16자 이하로 입력해주세요."
        } else {
            passwordStatusLabel.text = "\(statusMessage)를 최소 1자 이상 포함해주세요."
        }
        passwordTextField.layer.borderColor = UIColor.red.cgColor
    }
    
    func passwordMatch() {
        passwordConfirmStatusLabel.isValid = true
        passwordConfirmStatusLabel.text = "비밀번호가 일치합니다."
        passwordConfirmTextField.layer.borderColor = UIColor.black.cgColor
    }
    
    func passwordMismatch() {
        passwordConfirmStatusLabel.isValid = false
        passwordConfirmStatusLabel.text = "비밀번호가 일치하지 않습니다."
        passwordConfirmTextField.layer.borderColor = UIColor.red.cgColor
    }
    
    func nameEntered() {
        nameStatusLabel.isValid = true
        nameStatusLabel.alpha = 0
    }
    
    func nameNotEntered() {
        nameStatusLabel.isValid = false
        nameStatusLabel.text = "이름은 필수 입력 항목입니다."
        nameTextField.layer.borderColor = UIColor.red.cgColor
    }
    
    func enableNextButton() {
        nextButton.isEnabled = true
    }
    
    func disableNextButton() {
        nextButton.isEnabled = false
    }
}
