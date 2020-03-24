//
//  InputVerifierTests.swift
//  InputVerifierTests
//
//  Created by TTOzzi on 2020/03/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//
@testable import SignUp
import XCTest

class InputVerifierTests: XCTestCase {
    var verifier: InputVerifier!
    
    override func setUp() {
        verifier = InputVerifier()
    }

    func testIdVerify() {
        XCTAssertFalse(verifier.verifyIdInput(id: "abc"))
        XCTAssertFalse(verifier.verifyIdInput(id: "12345678901234567890abcde"))
        XCTAssertFalse(verifier.verifyIdInput(id: "abcde.fg"))
        XCTAssertTrue(verifier.verifyIdInput(id: "a_b_c_d-e1234"))
    }
}
