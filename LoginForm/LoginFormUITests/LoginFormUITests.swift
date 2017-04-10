//
//  LoginFormUITests.swift
//  LoginFormUITests
//
//  Created by Joanna Bednarz on 10/04/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest

class LoginFormUITests: XCTestCase {

    var app: XCUIApplication!
    override func setUp()
    {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launchEnvironment["NUMBER_OF_ATTEMPTS"] = "0"
        app.launch()

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

    func setUp(forTest testsCount: Int) {
        let credentials = [
            ("test@gmail.com", "dgbnnnbb"),
            ("", ""),
            ("gfdedkff@gmail.com", "grtegrgrtst")
        ]
        let emailIdTextField = app.textFields["Email ID"]
        let passwordSecureTextField = app.secureTextFields["Password"]

        for (no, (email, password)) in credentials.prefix(upTo: testsCount).enumerated() {
            fill(emailIdTextField, with: email)
            switch no {
            case 0:
                fill(passwordSecureTextField, with: password, clear: false)
            case 1:
                fill(passwordSecureTextField, with: password)
                passwordSecureTextField.tap()
            case 2:
                fill(passwordSecureTextField, with: password, clear: false)
                passwordSecureTextField.typeText("@123")
            default:
                break
            }
            app.buttons["Login"].tap()
            app.buttons["OK"].tap()
        }
    }
    
    func fill(_ field: XCUIElement, with text: String, clear: Bool = true) {
        field.tap()
        
        if clear, let stringValue = field.value as? String, stringValue != ""
        {
            // I don't know the implementation.
//            field.clearAndEnterText(field.value as! String)
        }
        
        field.typeText(text)
    }

}
