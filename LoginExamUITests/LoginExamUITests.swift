//
//  LoginExamUITests.swift
//  LoginExamUITests
//
//  Created by Jose Mari Pascual on 8/23/24.
//

import XCTest

final class LoginExamUITests: XCTestCase {
    
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app = XCUIApplication() // Initializes the XCTest app
        app.launch() // Launches the app
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
    }

    func testLogInButtonWithoutUsernameAndPassword() throws {
        // UI tests must launch the application that they test.
        let loginButton = app.buttons["LoginButton"]

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertTrue(loginButton.exists)
        loginButton.tap() // Tapped Login Button without username and password
        let alertButton = app.buttons["AlertButton"]
        XCTAssertTrue(alertButton.exists) // AlertView will show
        alertButton.tap() // Tap AlertButton to dismiss the AlertView
        XCTAssertFalse(app.buttons["AlertButton"].exists) // Verify if Alert View got dismiss.
    }
    
    func testLogInButtonWithtUsernameAndPassword() throws {
        // UI tests must launch the application that they test.
        let loginButton = app.buttons["LoginButton"]
        let usernameField = app.textFields["UsernameTextField"]
        let passwordField = app.secureTextFields["PasswordTextField"]
        XCTAssertTrue(usernameField.exists)
        XCTAssertTrue(passwordField.exists)
        if usernameField.exists {
            usernameField.tap()
            usernameField.typeText("sampleUsername")
        }
        if passwordField.exists {
            passwordField.tap()
            passwordField.typeText("passwordField")
        }

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertTrue(loginButton.exists)
        loginButton.tap() // Tapped Login Button with username and password
        sleep(5)
        let welcomeView = app.staticTexts["Welcome!"]
        XCTAssertTrue(welcomeView.exists) // Routed to welcome view
    }
}
