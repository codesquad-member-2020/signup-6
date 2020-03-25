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

    func testLessThanFiveChrId() {
        XCTAssertFalse(verifier.verifyIdInput(id: "abc"))
    }
    
    func testMoreThanTwentyChrId() {
        XCTAssertFalse(verifier.verifyIdInput(id: "12345678901234567890abcde"))
    }
    
    func testUnavailableSpecialChrId() {
        XCTAssertFalse(verifier.verifyIdInput(id: "abcde.fg"))
    }
    
    func testAvailableId() {
        XCTAssertTrue(verifier.verifyIdInput(id: "a_b_c_d-e1234"))
    }
    
    func testLessThanEightChrPW() {
        XCTAssertFalse(verifier.verifyPasswordInput(password: "Db1004@").0)
    }
    
    func testMoreThanSixteenChrPW() {
        XCTAssertFalse(verifier.verifyPasswordInput(password: "Db1004@1234567890").0)
    }
    
    func testNotIncludedUpperCasePW() {
        XCTAssertFalse(verifier.verifyPasswordInput(password: "db1004@@").0)
    }
    
    func testNotIncludedLowerCasePW() {
        XCTAssertFalse(verifier.verifyPasswordInput(password: "DB1004@@").0)
    }
    
    func testNotIncludedNumberPW() {
        XCTAssertFalse(verifier.verifyPasswordInput(password: "Dbangelcodesquad").0)
    }
    
    func testNotIncludedSpecialChrPW() {
        XCTAssertFalse(verifier.verifyPasswordInput(password: "Db1004codesquad").0)
    }
    
    func testAvailablePW() {
        XCTAssertTrue(verifier.verifyPasswordInput(password: "Db1004@@@squid").0)
    }
}
