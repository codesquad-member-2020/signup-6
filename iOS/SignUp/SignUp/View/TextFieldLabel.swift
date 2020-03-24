//
//  TextFieldLabel.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class TextFieldLabel: UILabel {
    private var textSize: CGFloat = 15.0
    private var insets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 10.0, right: 0.0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setProperties()
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    private func setProperties() {
        self.font = .systemFont(ofSize: textSize, weight: .semibold)
    }
}
