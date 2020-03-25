//
//  IdViewModel.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/25.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class IdViewModel {
    private let idRegExr = "^[a-z0-9_-]{5,20}$"
    var id = Dynamic<String>.init("")
    var idDidChanged: ((Bool) -> Void) = { _ in }
    var isIdValid = Dynamic<Bool>(false)
    
    init() {
        id.bind = { text in
            self.isIdValid.value = self.verifyIdInput(id: text)
        }
        isIdValid.bind = { result in
            self.idDidChanged(result)
        }
    }
    
    private func verifyIdInput(id: String) -> Bool {
        return !id.match(with: idRegExr).isEmpty
    }
}
