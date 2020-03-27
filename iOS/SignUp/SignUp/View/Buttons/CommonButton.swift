//
//  CustomButton.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/26.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class CommonButton: UIButton {
    private var textSize: CGFloat = 18.0
    private var activeColor = UIColor(red: 0.019, green: 0.652, blue: 0.0, alpha: 1)
    private var borderWidth: CGFloat = 0.8
    private var insets = UIEdgeInsets.init(top: 10.0, left: 12.0, bottom: 10.0, right: 12.0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setProperties(title: String, image: UIImage?) {
        self.setTitle(title, for: .normal)
        self.setImage(image, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: textSize)
        self.tintColor = activeColor
        self.layer.borderWidth = borderWidth
        self.contentEdgeInsets = insets
    }
}
