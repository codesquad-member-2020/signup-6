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
    }
}

extension ViewController: SignUpViewDelegate {
    func idTextFieldChanged(changes: String) {
        print(inputVerifier.verifyIdInput(id: changes))
    }
}
