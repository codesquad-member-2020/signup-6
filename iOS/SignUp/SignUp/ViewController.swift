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
        NotificationCenter.default.addObserver(self, selector: #selector(changedIdValid), name: InputVerifier.idValid, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changedIdInvalid), name: InputVerifier.idInvalid, object: nil)
    }
    
    @objc func changedIdValid() {
        signUpView.idValid()
    }
    
    @objc func changedIdInvalid() {
        signUpView.idInvalid()
    }
}

extension ViewController: SignUpViewDelegate {
    func idTextFieldChanged(changes: String) {
        inputVerifier.verifyIdInput(id: changes)
    }
}
