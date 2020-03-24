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
    private var topInset: CGFloat = 0.0
    private var bottomInset: CGFloat = 10.0
    private var leftInset: CGFloat = 0.0
    private var rightInset: CGFloat = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setProperties()
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    private func setProperties() {
        self.font = .systemFont(ofSize: textSize, weight: .semibold)
    }
}
