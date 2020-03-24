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
    
    func testPasswordVerify() {
        // 8글자 미만
        XCTAssertFalse(verifier.verifyPasswordInput(password: "Db1004@").0)
        // 16글자 초과
        XCTAssertFalse(verifier.verifyPasswordInput(password: "Db1004@1234567890").0)
        // 대문자 없음
        XCTAssertFalse(verifier.verifyPasswordInput(password: "db1004@@").0)
        // 소문자 없음
        XCTAssertFalse(verifier.verifyPasswordInput(password: "DB1004@@").0)
        // 숫자 없음
        XCTAssertFalse(verifier.verifyPasswordInput(password: "Dbangelcodesquad").0)
        // 특수문자 없음
        XCTAssertFalse(verifier.verifyPasswordInput(password: "Db1004codesquad").0)
        // 모든 조건 만족
        XCTAssertTrue(verifier.verifyPasswordInput(password: "Db1004@@@squid").0)
    }
}
