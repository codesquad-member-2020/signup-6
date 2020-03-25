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
    var isIdValid = false {
        didSet {
            idDidChanged(isIdValid)
        }
    }
    
    init() {
        id.bind = { text in
            self.isIdValid = self.verifyIdInput(id: text)
        }
    }
    
    func verifyIdInput(id: String) -> Bool {
        return !id.match(with: idRegExr).isEmpty
    }
}
