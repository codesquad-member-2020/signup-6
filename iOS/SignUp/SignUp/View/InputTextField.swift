//
//  InputTextField.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class InputTextField: UITextField {
    private var borderWidth: CGFloat = 0.8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setProperties()
    }

    private func setProperties() {
        self.layer.borderWidth = borderWidth
    }
}
