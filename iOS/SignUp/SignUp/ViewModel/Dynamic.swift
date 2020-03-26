//
//  Dynamic.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/25.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Dynamic<T> {
    var boundClosure: (T) -> Void = { _ in }
    var value: T? {
        didSet {
            boundClosure(value!)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
