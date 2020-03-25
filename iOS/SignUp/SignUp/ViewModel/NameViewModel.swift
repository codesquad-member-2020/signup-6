//
//  NameViewModel.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/26.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class NameViewModel {
    var name = Dynamic<String>("")
    var nameDidChanged: ((Bool) -> Void) = { _ in }
    var isNameValid = false {
        didSet {
            nameDidChanged(isNameValid)
        }
    }
    
    init() {
        name.bind = { text in
            self.isNameValid = !text.isEmpty
        }
    }
}
