//
//  PreviousButton.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/26.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class PreviousButton: CommonButton {
    private var buttonTitle = "이전"
    private var buttonImage = UIImage(systemName: "chevron.left.circle.fill")

    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties(title: buttonTitle, image: buttonImage)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setProperties(title: buttonTitle, image: buttonImage)
    }
}
