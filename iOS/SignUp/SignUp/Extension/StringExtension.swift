//
//  StringExtension.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/26.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

extension String {
    func match(with regExr: String) -> [NSTextCheckingResult] {
        let regularExpression = try! NSRegularExpression(pattern: regExr, options: .anchorsMatchLines)
        let result = regularExpression.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
        return result
    }
}
