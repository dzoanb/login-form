//
//  LoginFormTestsWithAutoMate.swift
//  LoginForm
//
//  Created by Joanna Bednarz on 10/04/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class LoginFormTestsWithAutoMate: AppUITestCase {

    override func setUp()
    {
        super.setUp()
        continueAfterFailure = true
        TestLauncher(options: [
            LaunchEnvironment(key: "NUMBER_OF_ATTEMPTS", value: "0")
            ])
            .configure(app)
            .launch()

        // UIApplication.shared.keyWindow?.layer.speed = 100
        //        UIApplication.sharedApplication().keyWindow?.layer.speed = 100
    }

    func testA1_TC8InvalidEmailAndPasswordTC8_A1()
    {
        setUp(forTest: 1)
        // Do Your asserts here
    }

    func testA2_TC9KeepAllFieldBlankTC9_A2()
    {
        setUp(forTest: 2)
        // Do Your asserts here
    }

    func testTC10ValidUsernameAndInvalidPasswordTC10C()
    {
        setUp(forTest: 3)
        // Do Your asserts here
    }

    func testAccountBlocked()
    {
        setUp(forTest: 3)
        app.buttons["Login"].tap()
        XCTAssertTrue(app.staticTexts["To many failures."].exists)
        // Do Your asserts here
    }

    func setUp(forTest testsCount: Int) {
        let credentials = [
            ("test@gmail.com", "dgbnnnbb"),
            ("", ""),
            ("gfdedkff@gmail.com", "grtegrgrtst@123")
        ]
        let emailIdTextField = app.textFields["Email ID"]
        let passwordSecureTextField = app.secureTextFields["Password"]

        for (email, password) in credentials.prefix(upTo: testsCount){
            emailIdTextField.clear(andType: email)
            passwordSecureTextField.clear(andType: password)
            app.buttons["Login"].tap()
            app.buttons["OK"].tap()
        }
    }
}
