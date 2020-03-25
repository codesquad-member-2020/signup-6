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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpView.delegate = self
        addObservers()
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

extension ViewController {
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(changedIdValid), name: InputVerifier.idValid, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changedIdInvalid), name: InputVerifier.idInvalid, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(enteredPasswordValid), name: InputVerifier.passwordValid, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(enteredPasswordInvalid), name: InputVerifier.passwordInvalid, object: nil)
    }
    
    @objc func changedIdValid() {
        signUpView.idValid()
    }
    
    @objc func changedIdInvalid() {
        signUpView.idInvalid()
    }
    
    @objc func enteredPasswordValid() {
        signUpView.passwordValid()
    }
    
    @objc func enteredPasswordInvalid(_ notification: Notification) {
        guard let notIncludedElements = notification.userInfo?[InputVerifier.passwordInvalid] as? String else { return }
        signUpView.passwordInvalid(with: notIncludedElements)
    }
}
