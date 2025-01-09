//
//  CalcUITests.swift
//  CalcUITests
//
//  Created by Hlib Lytvyn on 15.10.2024.
//

import XCTest

final class CalcUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testExample() throws {

    
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
                
        let resultLabel = app.staticTexts.element(boundBy: 0)

        XCTAssertTrue(resultLabel.exists, "Результирующий UILabel не найден.")
        let actualResult = resultLabel.label
            let expectedResult = "3"
            
            XCTAssertEqual(actualResult, expectedResult, "Expected result: \(expectedResult), but got: \(actualResult).")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
