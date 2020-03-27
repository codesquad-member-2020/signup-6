//
//  NameViewModel.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/26.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class NameViewModel {
    var name = Dynamic<String>.init("")
    var nameDidChanged: ((Bool) -> Void) = { _ in }
    var isNameValid = Dynamic<Bool>.init(false)
    
    init() {
        name.boundClosure = { text in
            self.isNameValid.value = !text.isEmpty
        }
        isNameValid.boundClosure = { result in
            self.nameDidChanged(result)
        }
    }
}
