//
//  StatusMessageLabel.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class StatusMessageLabel: UILabel {
    private var textSize: CGFloat = 12.0
    var isValid: Bool = false {
        didSet {
            isValid ? valid() : invalid()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setProperties()
    }
    
    private func setProperties() {
        self.font = .systemFont(ofSize: textSize)
        self.alpha = 0
    }
    
    private func valid() {
        self.alpha = 1
        self.textColor = .systemGreen
    }
    
    private func invalid() {
        self.alpha = 1
        self.textColor = .systemRed
    }
}
