//
//  TitleLabel.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class TitleLabel: UILabel {
    private var defaultColor = UIColor(red: 0.019, green: 0.652, blue: 0.0, alpha: 1)
    private var textSize: CGFloat = 30.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setProperties()
    }
    
    private func setProperties() {
        self.textColor = defaultColor
        self.font = .systemFont(ofSize: textSize, weight: .bold)
    }
}
