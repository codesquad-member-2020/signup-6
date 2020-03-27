//
//  NextButton.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class NextButton: CommonButton {
    private var buttonTitle = "다음"
    private var buttonImage = UIImage(systemName: "chevron.right.circle.fill")

    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties(title: buttonTitle, image: buttonImage)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setProperties(title: buttonTitle, image: buttonImage)
    }
    
    override func setProperties(title: String, image: UIImage?) {
        super.setProperties(title: title, image: image)
        self.isEnabled = false
    }
}
